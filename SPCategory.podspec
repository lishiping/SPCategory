Pod::Spec.new do |s|

  s.name         = "SPCategory"
  s.version      = "0.0.1"
  s.summary      = "Often used Category lib,size,string,hud,etc,常用类别库,size,字符串,hud等"
  s.homepage     = "https://github.com/lishiping/SPCategory.git"
  s.license      = "LICENSE"
  s.author       = { "lishiping" => "83118274@qq.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/lishiping/SPCategory.git",
                     :tag => s.version}

  s.dependency 'MBProgressHUD',           '1.0.0' 

  s.source_files = 'SPCategory/SPCategory/Category/*.{h,m,mm,cpp,c}'

  s.public_header_files = 'SPCategory/SPCategory/Category/*.h'
 
  s.frameworks = 'UIKit','Foundation'

  s.requires_arc = true

end
