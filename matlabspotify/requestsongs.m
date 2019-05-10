import matlab.net.http.RequestLine
import matlab.net.*
import matlab.net.http.*

playlistid = '37i9dQZF1DXcOYQJYGaYjk';
urlpart1 = 'https://api.spotify.com/v1/playlists/';
urlpart2 = '/tracks?fields=items(track(id%2Cname%2Cartists%2Calbum(release_date)))';
headerFields = {'Authorization', ['Bearer ', 'BQAr7Xg4TeO4CkNT8EpgkOZv6Jz_4svxzQ8fvqgU1pBNTnvnBOkj53KKMhcrEBcFLi7iLma3LlYWLd02JAS3TXWkSXN4KQLBdj1DVzofk3AjLiO_bShGUk-zccZK7dN7klUajatXLrjlFYZFEJc']};
options = weboptions('HeaderFields', headerFields, 'ContentType','json');
answer = webread(strcat(urlpart1,playlistid,urlpart2),options);