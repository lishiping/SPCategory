Pod::Spec.new do |s|

  s.name         = "SPCategory"
  s.version      = "0.0.5"
  s.summary      = "Often used Category lib,size,string,hud,etc,常用类别库,size,字符串,hud,错误页等"
  s.homepage     = "https://github.com/lishiping/SPCategory.git"
  s.license      = "LICENSE"
  s.author       = { "lishiping" => "83118274@qq.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/lishiping/SPCategory.git",
                     :tag => s.version}

  s.dependency 'MBProgressHUD',           '1.0.0' 
  s.dependency 'SafeData'

  s.source_files = 'SPCategory/Category/*.{h,m,mm,cpp,c}'

  s.public_header_files = 'SPCategory/Category/*.h'
 
  s.frameworks = 'UIKit','Foundation'

  s.resources = "SPCategory/Resource/*.bundle"

  s.requires_arc = true

end
