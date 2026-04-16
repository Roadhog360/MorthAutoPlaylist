# Rules:
If there is an official uploader, please use it. This is usually, but not always, a channel beginning with "Topic - "
No "extended" OSTs, please provide original length music only. Short extensions that only add a few minutes are permissible.

# Adding a playlist
- To add a YouTube playlist, use `!pldump` in one of Morth's voice channels. If you get an error, make sure the URL is a link to the playlist itself, and not a link to a song within said playlist.
  - If your playlist is not from YouTube, you will have to create a .txt file manually. Please ensure that the bot is able to play the URLs you give it, then compile them into a .txt file that adequately describes the title of your playlist.
- Upload the resulting .txt file to this repository, in the `autoplaylist` folder. Please describe what you added in the commit name.
- Then add the game name to the [Google Doc](https://docs.google.com/document/d/102t17U5nw0sExTavHCa5U9-ViPB1Ob0ENub2bRCvkLs) in its alphabetical order.
  - Note: Autoplaylist links can be practically anything and don't have to be YouTube links, but pldump is for YouTube only so you'll have to make the playlist yourself.
  - Game series break the alphabetical order to be grouped together chronologically. Some game series may not be ordered correctly as I am not familiar with all games whose OST are added; feel free to fix these errors yourself or let me know about them.
- When the bot is `!shutdown` it will restart on its own and fetch a compiled version of the playlist automatically.
  - This may take a while as the bot will check for updates if it hasn't been restarted in a while.
