# rapidxml

Originally downloaded from [Sourceforge](https://sourceforge.net/projects/rapidxml/), the [1.13
release with tests](https://sourceforge.net/projects/rapidxml/files/rapidxml/rapidxml%201.13/).

There is an [HTML Manual](http://htmlpreview.github.io/?https://github.com/tplunket/rapidxml/blob/master/manual.html) available as well a the original [license file](license.txt).

## Sourceforge docs

> RapidXml is an attempt to create the fastest XML parser possible, while retaining useability, portability and reasonable W3C compatibility. It is an in-situ parser with parsing speed approaching speed of strlen function executed on the same data.

Maybe we'll try to get some time with the [bugs](https://sourceforge.net/p/rapidxml/bugs/), look
through the [patches](https://sourceforge.net/p/rapidxml/patches/), and review the [feature
requests](https://sourceforge.net/p/rapidxml/feature-requests/).

## Development methods

Development of new features is going into branches. First thing that needs doing is getting all of
the tests running, then I can consider integrating others' work. I'm going to avoid pointless
changes like wholesale formatting or type changes because this code basically works. I have one
immediate need for it, however, which is *my* current focus: I need to fix `wchar_t` handling so that this works with native Windows "Unicode" (aka UTF-16) APIs. For the most part this means properly handling numeric character refs but also it needs to not just blindly copy between narrow- and wide-character strings when the user isn't paying attention. Getting UTF-8 data in wchars isn't terribly helpful, for example.

Once different features reach sufficient maturity I'll merge them into `master`.
