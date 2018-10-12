Pod::Spec.new do |spec|
  spec.name             = 'ScrollingTableViewsController'
  spec.version          = '0.4.0'
  spec.license      = 'MIT'
spec.swift_version = '4.2'
spec.platform     = :ios, "11.0"
  spec.homepage         = 'https://github.com/Kevinw14/ScrollingTableViewsController'
  spec.authors          = { 'Kevin Wood' => 'kevinlw14@gmail.com' }
  spec.summary          = 'Framework to help simplify placing two table views side-by-side.'
  spec.source           = { :git => 'https://github.com/Kevinw14/ScrollingTableViewsController.git', :tag => '0.4.0' }
  spec.source_files     = 'ScrollingTableViewsController/ScrollingTableViewsWithMenu.swift', 'ScrollingTableViewsController/MenuBar.swift', 'ScrollingTableViewsController/ScrollingView.swift', 'ScrollingTableViewsController/ScrollingTableView.swift','ScrollingTableViewsController/ScrollingTableViewController.swift'

end
