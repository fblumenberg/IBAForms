Pod::Spec.new do |s|
  s.summary = 'A simple iPhone forms library.'
  s.license = 'Apache License, Version 2.0'
  s.source = { :git => 'https://github.com/fblumenberg/IBAForms.git', :tag => '1.1.0.fb.3' }
  s.source_files = 'library/**/*.{h,m}'
  s.prefix_header_contents = "#ifdef __OBJC__\n    #import <CoreData/CoreData.h>\n#endif"
  s.author = { 'Itty Bitty Apps' => 'info@ittybittyapps.com', 'Sadat Rahman' => 'https://twitter.com/sadatrahman' }
  s.version = '1.1.0.fb.3'
  s.homepage = 'https://github.com/ittybittydude/IBAForms'
  s.name = 'IBAForms'
  s.requires_arc = true
  s.platform = :ios
  s.framework = 'CoreData'
end
