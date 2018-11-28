# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all

description = 'Awoolo PDF gives you the power to open, edit and convert PDF files in just a couple of clicks.'

feature_one_header = 'View And Annotate Your PDF Files'

feature_one_text = '<p>Do more than just open your PDF files.</p><p>By using the “notes tool” you can also add annotations, highlight or circle particular items, or apply anchor notes which you can view via the sidebar. You also have access to standard features like cropping and rotating.</p>'

feature_two_header = 'Convert PDF Files To Word In One Click (Or Vice Versa)'

feature_two_text = '<p>Stuck with a PDF you wish you could change to a Word doc? It’s easy to convert your PDF files using our PDF Viewer.</p><p>All it takes is one click… we’re not even kidding... there’s literally a giant “convert” button right in your face when you open your document.</p>'

feature_three_header = 'Intuitive Help Tab And User Interface'

feature_three_text = '<p>We made sure to keep the interface as simple, clean and user friendly as possible.</p><p>Like the unmissable “convert” button which saves you from having to search for it. Or our intuitive “help tab” which doesn’t just show you a “glossary of terms,” it literally gives you a visual road map to finding different commands and performing specific actions.</p>'

Product.create(title: 'PDF Viewer',
  slug: 'pdf_viewer',
  description: description,
  feature_one_header: feature_one_header,
  feature_one_text: feature_one_text,
  feature_two_header: feature_one_header,
  feature_two_text: feature_one_text,
  feature_three_header: feature_one_header,
  feature_three_text: feature_one_text,
  version_number: '1.0.1',
  app_name: 'Awoolo PDF',
  mac_software: true,
  windows_software: true,
  file_name_mac: 'Awoolo PDF.zip',
  file_name_windows: 'AwooloPDF.exe')

description = 'Awoolo Media is a convenient, no frills way to enjoy your favourite TV shows, music or movies.'

feature_one_header = 'Watch Your Favourite TV Shows And Movies Without Interruption'

feature_one_text = "<p>There’s nothing more frustrating than settling in to watch a movie with your spouse, when all of a sudden the “file type not supported” message pops up!</p><p>The good news is, our media player supports all of the common video types. Even some of the weird ones. Ensuring you won't have to cancel movie night.</p><p>Supported video files: WMV, MP4, MOV, AVI, MKV, MPG, M4V, VOB, ASF, FLV and more!</p>"

feature_two_header = 'Listen To Your Favourite Music And Podcasts'

feature_two_text = '<p>Compatible with a range of different audio files (see below), Awoolo media is the ideal place to listen to your favourite tunes or daily podcasts.</p><p>Supported audio files: MP3, WAV, FLAC, OGG, AAC, WMA, AIF and M4A</p>'

feature_three_header = 'Simple User Friendly Interface'

feature_three_text = '<p>Our media player’s stripped down interface contains only the essentials needed to watch or listen to media.</p><p>Doing this eliminates other pointless features, and also frees up space for faster and more efficient performance.</p>'

Product.create(title: 'Media Player', slug: 'media_player', description: description,
  feature_one_header: feature_one_header,
feature_one_text: feature_one_text,
feature_two_header: feature_one_header,
feature_two_text: feature_one_text,
feature_three_header: feature_one_header,
feature_three_text: feature_one_text,
version_number: '1.4',
app_name: 'Awoolo Media',
mac_software: true,
windows_software: true,
file_name_mac: 'Awoolo Media.zip',
file_name_windows: 'AwooloMedia.exe')

description = 'Awoolo Converter lets you convert any video file into a format which suits the device you’re watching on.'

feature_one_header = 'Watch Your Favourite TV Shows And Movies Without Interruption'

feature_one_text = "<p>There’s nothing more frustrating than settling in to watch a movie with your spouse, when all of a sudden the “file type not supported” message pops up!</p><p>The good news is, our media player supports all of the common video types. Even some of the weird ones. Ensuring you won't have to cancel movie night.</p><p>Supported video files: WMV, MP4, MOV, AVI, MKV, MPG, M4V, VOB, ASF, FLV and more!</p>"

feature_two_header = 'Listen To Your Favourite Music And Podcasts'

feature_two_text = '<p>Compatible with a range of different audio files (see below), Awoolo media is the ideal place to listen to your favourite tunes or daily podcasts.</p><p>Supported audio files: MP3, WAV, FLAC, OGG, AAC, WMA, AIF and M4A</p>'

feature_three_header = 'Simple User Friendly Interface'

feature_three_text = '<p>Our media player’s stripped down interface contains only the essentials needed to watch or listen to media.</p><p>Doing this eliminates other pointless features, and also frees up space for faster and more efficient performance.</p>'

Product.create(title: 'Video Converter', slug: 'video_converter', description: description, version_number: '1.0', app_name: 'Awoolo Converter', mac_software: true, windows_software: false, file_name_mac: 'Awoolo Converter.zip')

description = 'Awoolo Radio gives you instant access to hundreds of different radio stations from around the world.'

Product.create(title: 'Radio App', slug: 'radio_app', description: description, version_number: '1.0', app_name: 'Awoolo Radio', mac_software: true, windows_software: false, file_name_mac: 'Awoolo Radio.zip')

description = 'Easily extract your compressed files and folders with Awoolo Unzip.'

Product.create(title: 'Zip File Opener', slug: 'zip_file_opener', description: description, version_number: '1.0', app_name: 'Awoolo Unzip', mac_software: true, windows_software: false, file_name_mac: 'Awoolo Unzip.zip')

description = 'Convert Your Video, Audio and Text Files... All In One Place.'

Product.create(title: 'Ultimate Converter', slug: 'ultimate_converter', description: description, version_number: '1.0', app_name: 'Awoolo Ultimate', mac_software: false, windows_software: true, file_name_windows: 'AwooloUltimateSetup6.9.2.exe')
