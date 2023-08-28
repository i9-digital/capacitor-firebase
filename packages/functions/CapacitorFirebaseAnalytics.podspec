require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name = 'CapacitorFirebaseFunctions'
  s.version = package['version']
  s.summary = package['description']
  s.license = package['license']
  s.homepage = package['repository']['url']
  s.author = package['author']
  s.source = { :git => package['repository']['url'], :tag => s.version.to_s }
  s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
  s.ios.deployment_target  = '13.0'
  s.dependency 'Capacitor'
  s.swift_version = '5.1'
  s.static_framework = true
  s.default_subspec = 'Lite'

  s.subspec 'Lite' do |lite|
    # Default subspec that does not contain optional third party dependencies.
  end

  s.subspec 'Functions' do |functions|
    functions.dependency 'FirebaseFunctions', '10.8.0'
  end

  s.subspec 'FunctionsWithoutAdIdSupport' do |functionsWithoutAdIdSupport|
    functionsWithoutAdIdSupport.dependency 'FirebaseFunctions/WithoutAdIdSupport', '10.8.0'
  end
end
