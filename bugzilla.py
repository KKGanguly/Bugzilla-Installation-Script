import os
import webbrowser
os.system("service apache2 restart")
url = "http://localhost"
webbrowser.open_new(url)
