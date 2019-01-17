# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all

Feature.delete_all

description = 'Awoolo PDF gives you the power to open, edit and convert PDF files in just a couple of clicks.'

Product.create(
  title: 'Awoolo PDF',
  slug: 'awoolo_pdf',
  description: description,
  version_number: '1.0.1',
  app_name: 'AwooloPDF',
  mac: true,
  windows: true,
  file_name_mac: 'https://s3.amazonaws.com/downloadape/awoolo/AwooloPDF.zip',
  file_name_windows: 'https://s3.amazonaws.com/downloadape/awoolo/AwooloPDF.exe',
  file_size: '4.0 MB'
)

description = 'Awoolo Media is a convenient, no frills way to enjoy your favourite TV shows, music or movies.'

Product.create(
  title: 'Awoolo Media',
  slug: 'awoolo_media',
  description: description,
  version_number: '1.4',
  app_name: 'AwooloMedia',
  mac: true,
  windows: true,
  file_name_mac: 'https://s3.amazonaws.com/downloadape/awoolo/AwooloMedia.zip',
  file_name_windows: 'https://s3.amazonaws.com/downloadape/awoolo/AwooloMedia.exe',
  file_size: '5.7 MB')

description = 'Awoolo Converter lets you convert any video file into a format which suits the device you’re watching on.'

Product.create(
  title: 'Awoolo Converter',
  slug: 'awoolo_converter',
  description: description,
  version_number: '1.0',
  app_name: 'AwooloConverter',
  mac: true,
  windows: false,
  file_name_mac: 'https://s3.amazonaws.com/downloadape/awoolo/AwooloConverter.zip',
  file_size: '13.4 MB')

description = 'Awoolo Radio gives you instant access to hundreds of different radio stations from around the world.'

Product.create(
  title: 'Awoolo Radio',
  slug: 'awoolo_radio',
  description: description,
  version_number: '1.0',
  app_name: 'AwooloRadio',
  mac: true,
  windows: false,
  file_name_mac: 'https://s3.amazonaws.com/downloadape/awoolo/AwooloRadio.zip',
  file_size: '20.1 MB')

description = 'Easily extract your compressed files and folders with Awoolo Unzip.'

Product.create(
  title: 'Awoolo Unzip',
  slug: 'awoolo_unzip',
  description: description,
  version_number: '1.0',
  app_name: 'AwooloUnzip',
  mac: true,
  windows: false,
  file_name_mac: 'https://s3.amazonaws.com/downloadape/awoolo/AwooloUnzip.zip',
  file_size: '2.0 MB')

description = 'Convert Your Video, Audio and Text Files... All In One Place.'

Product.create(
  title: 'Awoolo Ultimate',
  slug: 'awoolo_ultimate',
  description: description,
  version_number: '1.0',
  app_name: 'AwooloUltimate',
  mac: false,
  windows: true,
  file_name_windows: 'https://s3.amazonaws.com/downloadape/awoolo/AwooloUltimateSetup6.9.2.exe',
  file_size: '153.3 MB')

description = 'Easily Manage And Move Your Files Between Servers'

Product.create(
  title: 'Awoolo File',
  slug: 'awoolo_file',
  description: description,
  version_number: '1.0',
  app_name: 'AwooloFile',
  mac: false,
  windows: true,
  file_name_windows: 'https://s3.amazonaws.com/downloadape/awoolo/AwooloFile.exe',
  file_size: '6.7 MB')

description = 'Awoolo Speed Test allows users to measure the speed of their Internet Connection either on mobile, PC and other devices.'

Product.create(
  title: 'Awoolo Speed Test',
  slug: 'awoolo_speed_test',
  description: description,
  version_number: '1.0',
  app_name: 'AwooloSpeedTest',
  mac: false,
  windows: true,
  file_name_mac: '',
  file_name_windows: 'https://s3.amazonaws.com/downloadape/awoolo/AwooloSpeedTest.exe',
  file_size: '50.8 MB'
)

product = Product.find_by(slug: 'awoolo_pdf')

Feature.create(
  header: 'View And Annotate Your PDF Files',
  content: '<p>Do more than just open your PDF files.</p><p>By using the “notes tool” you can also add annotations, highlight or circle particular items, or apply anchor notes which you can view via the sidebar. You also have access to standard features like cropping and rotating.</p>',
  product: product
)

Feature.create(
  header: 'Convert PDF Files To Word In One Click (Or Vice Versa)',
  content: '<p>Stuck with a PDF you wish you could change to a Word doc? It’s easy to convert your PDF files using our PDF Viewer.</p><p>All it takes is one click… we’re not even kidding... there’s literally a giant “convert” button right in your face when you open your document.</p>',
  product: product
)

Feature.create(
  header: 'Intuitive Help Tab And User Interface',
  content: '<p>We made sure to keep the interface as simple, clean and user friendly as possible.</p><p>Like the unmissable “convert” button which saves you from having to search for it. Or our intuitive “help tab” which doesn’t just show you a “glossary of terms,” it literally gives you a visual road map to finding different commands and performing specific actions.</p>',
  product: product
)

product = Product.find_by(slug: 'awoolo_media')

Feature.create(
  header: 'Watch Your Favourite TV Shows And Movies Without Interruption',
  content: "<p>There’s nothing more frustrating than settling in to watch a movie with your spouse, when all of a sudden the “file type not supported” message pops up!</p><p>The good news is, our media player supports all of the common video types. Even some of the weird ones. Ensuring you won't have to cancel movie night.</p><p>Supported video files: WMV, MP4, MOV, AVI, MKV, MPG, M4V, VOB, ASF, FLV and more!</p>",
  product: product
)

Feature.create(
  header: 'Listen To Your Favourite Music And Podcasts',
  content: '<p>Compatible with a range of different audio files (see below), Awoolo media is the ideal place to listen to your favourite tunes or daily podcasts.</p><p>Supported audio files: MP3, WAV, FLAC, OGG, AAC, WMA, AIF and M4A</p>',
  product: product
)

Feature.create(
  header: 'Simple User Friendly Interface',
  content: '<p>Our media player’s stripped down interface contains only the essentials needed to watch or listen to media.</p><p>Doing this eliminates other pointless features, and also frees up space for faster and more efficient performance.</p>',
  product: product
)

product = Product.find_by(slug: 'awoolo_file')

Feature.create(
  header: 'Simple Navigation Anyone Can Use',
  content: "<p>We designed our interface to make your life as easy as possible.</p><p>Including bar tabs which allow you to browse multiple servers and transfer files at the same time. And appropriately labeled action buttons to make transferring files a breeze.</p>",
  product: product
)

Feature.create(
  header: 'Safely And Efficiently Manage Your Files',
  content: '<p>With our built-in file management system you’ll always be on top of uploading or downloading files between servers.</p><p>For example, you can pause and continue transfers - which helps with speed and the prioritising of your files. You can also rename your files without having to download and reupload them back to the server.</p>',
  product: product
)

Feature.create(
  header: 'Bypass Complex Directories With Bookmarks',
  content: '<p>Does your server contain complex directories? This clever bookmark feature remembers your folder paths, meaning you can skip long directory lists to reach specific folders. Making for faster and easier navigation.</p>',
  product: product
)

product = Product.find_by(slug: 'awoolo_radio')

Feature.create(
  header: 'Choose Your Ideal Radio Station by Genre',
  content: "<p>With Awoolo Radio you can choose from hundreds of different music genres. Anything from classic rock and R&B, to KPOP and JPOP! We’re not kidding when we say there’s a genre for everyone.</p>",
  product: product
)

Feature.create(
  header: 'Choose Your Ideal Radio Station by Country',
  content: "<p>Have a favourite radio station you listen to when you visit a particular country? Awoolo Radio also gives you instant access to hundreds of radio stations, from countries all over the world.</p>",
  product: product
)

Feature.create(
  header: 'Create Custom Playlists Of Your Favourite Stations',
  content: "<p>So you don’t lose the perfect station that plays all of the songs you love.</p><p>We made it easy to keep track of your favourite stations. All you have to do is hit  “add to playlist” and that station gets added to your unique playlist.</p><p>Once playing, if a particular station isn’t quite fitting the mood, simply hit next to switch to one of your other favourite stations.</p>",
  product: product
)

product = Product.find_by(slug: 'awoolo_unzip')

Feature.create(
  header: 'Compatible With A Range Of Compressed File Types',
  content: "<p>Including: ZIP, RAR, RPM, SPLIT, TAR, WIM, ISO, IZH, Z, LZMA, 7Z, ARJ, BZIP2, CAB, CHM, COMPOUND, CPIO, DEB, GZIP.</p>",
  product: product
)

Feature.create(
  header: 'Automatically Create A Directory Folder',
  content: "<p>When you’re extracting multiple files that do not belong to a containing folder - this option really comes in handy. Especially if you want to avoid a whole lot of extracted files spread all over your desktop or downloads folder.</p><p>Simply select the “force directory” option, and a new directory folder will automatically be created containing all of your extracted files.</p>",
  product: product
)

Feature.create(
  header: 'Extract Files With Lightning Speed',
  content: "<p>Awoolo Zip does one thing, and it does one thing incredibly well: extract files.</p><p>Because of this, you’re not having to wait for minutes on end like you would with a standard extractor. Instead your files are ready to access in mere seconds.</p>",
  product: product
)

product = Product.find_by(slug: 'awoolo_converter')

Feature.create(
  header: 'Works With A Range Of Video Formats',
  content: "<p>Including: WMV, MP4, MOV, AVI, MKV, MPG, M4V, VOB, ASF, FLV and more!</p>",
  product: product
)

Feature.create(
  header: 'Convert Based On Device, Not Confusing File Types',
  content: "<p>FLV, MP4, MPEG, WMV, AVI… which one to choose?</p><p>A lot of times it depends on the device you’re watching on. Which is why rather than choosing a file type to convert to - you can instead choose from a range of common devices like Macs, Tablets, IPhones and Androids.</p><p>Our converter will then automatically convert your video to the file type that best suits your device.</p>",
  product: product
)

Feature.create(
  header: 'Convert Your Video Files To Audio',
  content: "<p>As well as converting to a range of different video formats, you can also convert your video files to audio files if needed.</p><p>Perfect for isolating the audio from music videos, or anything else where only the audio is needed. It’ll also save you file space!</p>",
  product: product
)

product = Product.find_by(slug: 'awoolo_ultimate')

Feature.create(
  header: 'Compatible With A Range Of Audio, Video And Text Files',
  content: "<p>Supported Documents: PDF, DOCX, DOC, TXT and RTF<br>Supported Audio Files: MP3, WAV, FLAC, OGG, AAC, WMA, AIF and M4A<br>Supported Video Files: WMV, MP4, MOV, AVI, MKV, MPG, M4V, VOB, ASF and FLV.<br></p>",
  product: product
)

Feature.create(
  header: 'Convert To Suit Almost Any Viewing Device',
  content: "<p>Like our video converter, The Ultimate Converter helps make sure you’re converting to the right file type - based on the device you’re using.</p><p>No more guessing and hoping a particular file type works on your TV or Playstation.</p><p>Supported Devices: iPhone 10, 8, 7, 6+ and 6, iPad 3 and 4, Apple TV, TV2, TV3 and TV4, Apple Generic, Samsung Galaxy S9, S8, S7 and S6, Galaxy Note, Kindle Fire, XBox One, XBox 360, PSP, PS3, PS4, Wii, HDTV and 4K</p>",
  product: product
)

Feature.create(
  header: 'Start Converting In Three Clicks',
  content: "<p>First click: select or drag in the file you wish to upload and convert.</p><p>Second click: select the preferred watching device (if applicable) e.g. Apple TV.</p><p>Third click: hit convert!</p>",
  product: product
)

product = Product.find_by(slug: 'awoolo_speed_test')

Feature.create(
  header: 'User Friendly Desktop Application',
  content: '<p>This amazing software comes with a very simple and easy-to-use interface.</p><p>You can easily test the download and upload speed of your internet connection in just few clicks.</p><p>Users can see the results in just few seconds.</p><p>This will allow them to compare the speed they are getting against the speed promised by their respective Internet Service Provider.</p>',
  product: product
)

Feature.create(
  header: 'Accurate Results',
  content: '<p>You should always get the Internet connection you deserve. Users must be completely aware of the speed they are getting. With this software, you can get the most accurate result.</p><p>Metrics like Download Speed, Upload Speed, Ping, Jitter and Packet Loss are provided in the most accurate manner so you can confidently compare the details against the parameters stated from your selected Internet Speed plan.</p>',
  product: product
)

Feature.create(
  header: 'Compatible with Windows 7 or Later',
  content: '<p>Just download the Software and follow the instructions.</p><p>Once it is finished, you can start testing your internet speed.</p>',
  product: product
)

puts 'Database Seeded.'
