# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all

Product.create(title: 'PDF Converter', slug: 'pdf_converter')

Product.create(title: 'Media Player', slug: 'media_player')

Product.create(title: 'Video File Converter', slug: 'video_file_converter')

Product.create(title: 'Word Processor', slug: 'word_processor')

Product.create(title: 'Radio App', slug: 'radio_app')

Product.create(title: 'Zipfile Opener', slug: 'zipfile_opener')

Product.create(title: 'FTP Client', slug: 'ftp_client')
