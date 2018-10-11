Pod::Spec.new do |s|

s.name         = "ScrollingTableViewsController"
s.version      = "0.1"
s.summary      = "0.1"
s.platform     = :ios, "11.0"
s.swift_version = '4.2'
s.description  = "Framework to help simplify placing two table views side-by-side"
s.homepage     = "https://github.com/Kevinw14/ScrollingTableViewsController"
s.license      = "MIT"
s.author             = { "Kevin Wood" => "kevinlw14@gmail.com" }
s.source_files  = 'ScrollingTableViewsController/*.{h,m,swift}'
s.source = {:git => "https://github.com/Kevinw14/ScrollingTableViewsController.git", :tag => "0.1"}
end
