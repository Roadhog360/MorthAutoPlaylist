# Rules:
If there is an official uploader, please use it. This is usually, but not always, a channel beginning with "Topic - "
No "extended" OSTs, please provide original length music only. Short extensions that only add a few minutes are permissible.

# Adding a playlist
- To add a YouTube playlist, use `!pldump` in one of Morth's voice channels. If you get an error, make sure the URL is a link to the playlist itself, and not a link to a song within said playlist. Please remove the `playlist_` from its name.
  - If your playlist is not from YouTube, you will have to create a .txt file manually. Please ensure that the bot is able to play the URLs you give it, then compile them into a .txt file that adequately describes the title of your playlist. Ensure a line beginning with `#` is at the top of your file that contains its name. Such as `# My Playlist Name`. Do not add any other lines beginning with `#` unless they are directly after the first one. This is necessary for the scripts I wrote that combine the playlists to work.
- Upload the resulting .txt file to this repository, in the `autoplaylist` folder. Please describe what you added in the commit name.
- Then add the game name to the [playlists document](https://github.com/Roadhog360/MorthAutoPlaylist/blob/main/PLAYLISTS.md) in its alphabetical order.
  - Note: Autoplaylist links can be practically anything and don't have to be YouTube links, but pldump is for YouTube only so you'll have to make the playlist yourself.
  - Game series break the alphabetical order to be grouped together chronologically. Some game series may not be ordered correctly as I am not familiar with all games whose OST are added; feel free to fix these errors yourself or let me know about them.
- When the bot is `!shutdown` it will restart on its own and fetch a compiled version of the playlist automatically.
  - This may take a while as the bot will check for updates if it hasn't been restarted in a while.

  # How to commit
  If you're new to GitHub and are unsure what "commit" means or how to perform one, it's quite simple. It can be done in your browser without downloading anything. However if you know how to use Git or GitHub Desktop you can use that. If you don't, follow the below step.
  Simply navigate to the [autoplaylist](https://github.com/Roadhog360/MorthAutoPlaylist/tree/main/autoplaylist) folder in the repository. Click the "add file" button near the top right corner of the file list, then click "upload files". From there, add the playlists created as per the instructions above, and describe what you added in your commit. Make sure "commit directly to the `main` branch" is selected then just click commit changes. Done! It is really that simple. The rest of the process is handled automatically by scripting.
