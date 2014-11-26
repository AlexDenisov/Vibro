Pod::Spec.new do |s|
  s.name     = 'VibroFramework'
  s.version  = '0.1.0'
  s.license  = 'MIT'
  s.summary  = 'Feel the network interaction'
  s.homepage = 'https://github.com/AlexDenisov/Vibro'
  s.description = "Vibrates your device whenever your app sends network request"
  s.author   = { "AlexDenisov" => "1101.debian@gmail.com" }
  s.source   = { :http => "https://github.com/AlexDenisov/Vibro/releases/download/0.1.0/Vibro-#{s.version.to_s}.zip" }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.preserve_paths = "Vibro/Vibro.framework"
  s.vendored_frameworks = 'Vibro/Vibro.framework'
  s.license      = { :type => 'MIT', :file => 'Vibro/LICENSE' }
end
