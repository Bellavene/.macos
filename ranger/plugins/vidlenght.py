import os
import json
import subprocess
from pathlib import Path
from datetime import timedelta

from ranger.api.commands import Command

video_extensions = (
    ".mp4",
    ".mkv",
    ".avi",
    ".webm",
    ".mpg",
    ".mp2",
    ".mpeg",
    ".mpe",
    ".mpv",
    ".ogg",
    ".mp4",
    ".m4p",
    ".m4v",
    ".wmv",
    ".mov",
    ".qt",
    ".flv",
    ".swf",
)


def get_length(path: Path) -> float:
    cmd = [
        "ffprobe",
        "-v",
        "quiet",
        "-print_format",
        "json",
        "-show_entries",
        "format=duration",
        path,
    ]
    output = subprocess.check_output(cmd)
    json_output = json.loads(output)
    length = json_output["format"]["duration"]
    return float(length)


def format_seconds(seconds: float) -> str:
    delta = timedelta(seconds=seconds)
    return str(delta)


def is_video(path: str):
    return os.path.splitext(path)[1].lower() in video_extensions


def get_files_recursive(path: Path, filter) -> list:
    files = [
        os.path.join(dp, f)
        for dp, _, filenames in os.walk(path)
        for f in filenames
        if filter(f)
    ]
    return files


def get_videos(selected: list) -> list:
    videos = []
    for video in selected:
        path = Path(video)
        if path.is_dir():
            files = get_files_recursive(path, is_video)
            videos.extend(files)
        elif is_video(video):
            videos.append(video)
    return videos


def get_total_length(videos: list) -> float:
    total_length = 0
    for video in videos:
        length = get_length(video)
        total_length += length
    return total_length


class vidlength(Command):
    """:vidlength

    Get the length of selected videos recursively
    """

    def execute(self):
        selected = [f.path for f in self.fm.thistab.get_selection()] or [
            self.fm.thisfile.path
        ]

        videos = get_videos(selected)
        total_length = get_total_length(videos)

        formatted_length = format_seconds(total_length)
        self.fm.notify(formatted_length)
