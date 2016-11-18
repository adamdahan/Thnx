Pod::Spec.new do |s|
  s.name             = 'Thnx'
  s.version          = '0.0.1'
  s.summary          = 'Open Source Library for giving credit where it is due.' 
  s.description      = <<-DESC
Thnx is a Fully Customizable Open Source Library Attribution framework that is used to credit the teams behind the code you use in your projects.
                       DESC
 
  s.homepage         = 'https://github.com/adamdahan/Thnx'
  s.license          = { :type => 'BSD', :file => 'LICENSE.md' }
  s.author           = { 'adamdahan' => 'adam@88labs.com' }
  s.source           = { :git => 'https://github.com/adamdahan/Thnx.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = 'Thnx/Thnx/*.swift'
end
