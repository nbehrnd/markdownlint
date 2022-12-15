Content of folder debian after running gem2deb and manual edits:

norwid@debian:~/Build/ruby-packaging/ruby-mdl$ gio tree -h ./debian/
file:///home/norwid/Build/ruby-packaging/ruby-mdl/debian
|-- .debhelper
|   `-- generated
|       |-- _source
|       |   `-- home
|       `-- ruby-mdl
|           |-- dh_installchangelogs.dch.trimmed
|           `-- installed-by-dh_installdocs
|-- changelog
|-- control
|-- copyright
|-- debhelper-build-stamp
|-- files
|-- ruby-mdl
|   |-- DEBIAN
|   |   |-- control
|   |   `-- md5sums
|   `-- usr
|       |-- bin
|       |   `-- mdl
|       `-- share
|           |-- doc
|           |   `-- ruby-mdl
|           |       |-- changelog.Debian.gz
|           |       `-- copyright
|           `-- rubygems-integration
|               `-- all
|                   |-- gems
|                   |   `-- mdl-0.12.0
|                   |       |-- bin
|                   |       |   `-- mdl
|                   |       `-- lib
|                   |           |-- mdl
|                   |           |   |-- cli.rb
|                   |           |   |-- config.rb
|                   |           |   |-- doc.rb
|                   |           |   |-- kramdown_parser.rb
|                   |           |   |-- rules.rb
|                   |           |   |-- ruleset.rb
|                   |           |   |-- style.rb
|                   |           |   |-- styles
|                   |           |   |   |-- all.rb
|                   |           |   |   |-- cirosantilli.rb
|                   |           |   |   |-- default.rb
|                   |           |   |   `-- relaxed.rb
|                   |           |   `-- version.rb
|                   |           `-- mdl.rb
|                   `-- specifications
|                       `-- mdl-0.12.0.gemspec
|-- ruby-mdl.substvars
|-- rules
|-- salsa-ci.yml
|-- source
|   `-- format
|-- upstream
|   `-- metadata
`-- watch
norwid@debian:~/Build/ruby-packaging/ruby-mdl$ 
