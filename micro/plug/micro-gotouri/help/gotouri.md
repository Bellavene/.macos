# gotouri Plugin #

The gotouri plugin provides the user with the ability
to goto uri quickerly. 

### To initiate the function
Fisrt. Move the cusor on or before the target link uri,  
Then run:

```
> gotouri
```

### To open uri with a cusom command
{uri} in option string will be replaced with true uri value  
Run to set cmd option:

```
> set gotouri.cmd "yourCustomCommand"
```

An example to open uri with chrome in incognito:
 
```
> set gotouri.cmd "path/to/chrome/executable -incognito {uri}"
```

Reset to default:

```
> set gotouri.cmd "default"
```