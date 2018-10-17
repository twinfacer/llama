# Llama
Project scaffold generator. Internaly uses __git__ to grab template and __ERB__ for template processing magic.

![llama](https://static.vecteezy.com/system/resources/previews/000/129/338/non_2x/free-llama-background-vector.jpg)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'llama'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install llama

## Usage
Following command will create directory __PROJECT_NAME__ in current directory (and fails if it already exists unless __-f,--force__ option provided), clones git repository TEMPLATE to it and process cloned template (as described bellow).
```shell
  llama new PROJECT_NAME -t[, --template=]TEMPLATE [-f,--force=false]
```
Accepts __TEMPLATE__ in form of github __:username/:reponame__ or full repo url.

```shell
$ llama new fancy_app -t twinfacer/template_test
$ llama new another_fancy_app -t git@github.com:twinfacer/llama.git
```

Template is just git repo which would be cloned to destination (with some ~~magic~~ extra processing described below in process).

## Processing
While cloninig __llama__ will do some extra steps which can be used to edit cloned repo (replace class names to match project name, rename binaries, etc).

- _@PROJECT_NAME@_ in file/directory names will be replaced with __PROJECT_NAME__.

- [ERB](https://ruby-doc.org/stdlib-2.5.1/libdoc/erb/rdoc/ERB.html) can be used inside any text file. Llama exposes two methods which return project name - __project_name__ (snake_cased for method/function names, import/require statements) and __app_name__ (CamelCased, usefull for ruby/js class names).

## Credits
- logo [Vecteezy](https://www.vecteezy.com)
