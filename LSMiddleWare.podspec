Pod::Spec.new do |s|

  
  s.name         = "LSMiddleWare"
  s.version      = "0.0.1"
  s.summary      = "LSMiddleWare."

  
  s.description  = <<-DESC 
                         LSMiddleWare  中间件组件，包括路由器，组件模块管理器
                   DESC

  s.homepage     = "https://github.com/LISONG040576/LSMiddleWare.git"
  
  s.license      = "MIT"
  
  s.author             = { "lisong" => "lisong.s@haier.com" }
  
  s.source       = { :git => "https://github.com/LISONG040576/LSMiddleWare.git", :tag => s.version.to_s }

  s.source_files  = "LSMiddleWare"

  #s.resources = '上移动画/*.{jpg,png}'

  s.requires_arc = true

  s.platform = :ios

  s.frameworks ="UIKit","Foundation"

  s.ios.deployment_target = '6.0'


  #s.dependency "SJRouter"














  # s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.



  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end