# -*- encoding: sjis -*-
require 'rqrcode'
require 'rqrcode_png'
require 'chunky_png'

qr = RQRCode::QRCode.new( "https://www.geeeek.site/")


png = qr.as_png(
          resize_gte_to: false,
          resize_exactly_to: false,
          fill: 'white',
          color: 'black',
          size: 1000,
          border_modules: 4,
          module_px_size: 10,
          file: nil # path to write
          );

File.write("./code.png", png.to_s, external_encoding: "ASCII-8BIT" )

