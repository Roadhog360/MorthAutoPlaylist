# Rules:
If there is an official uploader, please use it. For YouTube, this is usually, but not always, a channel ending with "Topic", and the playlist ID beginning with `OLAK`. Unofficial reuploads from Bandcamp or Soundcloud albums will not be added.
No "extended" OSTs, please provide original length music only, however short extensions that only add a few minutes may be permissible if no original length version is available.

# Adding a playlist
- To add a playlist, use `!pldump` in one of Morth's voice channels. If you get an error, make sure the URL is a link to the playlist itself, and not a link to a song within said playlist. Please remove the `playlist_` from its name.
  - It is preferred that the music is an official Bandcamp upload, Soundcloud comes second, and YouTube.
  - If your YouTube playlist is an official playlist, (indicated by the playlist ID starting with `OLAK`) visit the playlist with https://music.youtube.com to redirect to a version that has no music videos, then copy the URL and change back to https://www.youtube.com when dumping it. This redirects to a hidden version of the playlist that never has music video versions of a song, which also inadvertently guarantees the songs are not unofficial reuploads.
  - If your playlist is not supported by yt-dlp or the bot, (indicated by `!pldump` failing) you will have to create a .txt file manually. Please ensure that the bot is able to play the URLs you give it, then compile them into a .txt file that adequately describes the title of your playlist. Ensure a line beginning with `#` is at the top of your file that contains its name. Such as `# My Playlist Name`. Do not add any other lines beginning with `#` unless they are directly after the first one. This is necessary for the scripts I wrote that combine the playlists to work.
- Upload the resulting .txt file to this repository, in the `autoplaylist` folder. Please describe what you added in the commit name.
- Then add the game name, alongside a playlist URL (if applicable) to the [playlists document](https://github.com/Roadhog360/MorthAutoPlaylist/blob/main/PLAYLISTS.md) in its alphabetical order. Different volumes should be separated accordingly, by the album name or just "Vol. 1", "Vol. 2" etc, check other entries for how it's done.
  - Note: Autoplaylist links can be practically anything and don't have to be YouTube links, but pldump only supports certain websites such YouTube or Bandcamp natively. Instructions for manually making an album txt file are above.
  - Game series break the alphabetical order to be grouped together chronologically. Some game series may not be ordered correctly as I am not familiar with all games whose OST are added; feel free to fix these errors yourself or let me know about them.

  # How to commit
  If you're new to GitHub and are unsure what "commit" means or how to perform one, it's quite simple. It can be done in your browser without downloading anything. However if you know how to use Git or GitHub Desktop you can use that. If you don't, follow the below step.
  Simply navigate to the [autoplaylist](https://github.com/Roadhog360/MorthAutoPlaylist/tree/main/autoplaylist) folder in the repository. Click the "add file" button near the top right corner of the file list, then click "upload files". From there, add the playlists created as per the instructions above, and describe what you added in your commit. Make sure "commit directly to the `main` branch" is selected then just click commit changes. Done! It is really that simple. The rest of the process is handled automatically by scripting.
  ## TIP:
- When the bot is `!shutdown` it will restart on its own and fetch a compiled version of the playlist automatically.
  - This may take a while as the bot will check for updates if it hasn't been restarted in a while.
