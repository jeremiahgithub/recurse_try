## Recurse Try Everything:
The plugin that makes trying everything easier.
## Setup:
Edit your Gemfile:
```
gem "recurse_try", "~> 0.0.1"
```
Or:
```
gem install recurse_try
```
## Include it in your project:
* Don't worry - all you need to do is include it on the object that your calling it from. All sub objects will automatically use it once called.
```
class String
  include RecurseTry
end
```
Or
```
String.send(:include, RecurseTry)
```
* And now this works even though the return of the first method is an integer.
```
'12345plusjunk'.recurse_try('to_i.to_s.reverse')
```
Rails:
I recommend that you put it on your model. That's where I use it.
```
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include RecurseTry
end
```
You can also add it to Object or any other object in your initializers etc.
```
class Object
  include RecurseTry
end
```
## Uses:
```
Host.recurse_try([{:new=>{:fqdn=>:test}}, :save])
Host.recurse_try([{:new=>{:fqdn=>:test}}, {update: {type: Hypervisor}}])
Host.recurse_try('first.owner.name')
Host.recurse_try('all.map.owner.name')
Host.recurse_try({includes: {remote_mounts: :filer}}, 'remote_mounts.filer.name')
Host.recurse_try([:first, :owner, :name])
Host.recurse_try([:first, :owner, {update: {name: :test}}])
Host.recurse_try(['first.owner.name', {'==': 'test'}])
```
And now just for fun
```
' time mad Taco cat '.recurse_try('upcase.reverse.strip')
'123456789'.recurse_try({split: ''},'map','to_i',{'+': 1}).join #"2345678910"
```
