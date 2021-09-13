# NeetoCompliance

This gem would audit and check a repository for compliance with Neeto development guidelines. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'neeto_compliance'
```

Also add a step into the CI process:

```yaml

- name: Neeto Compliance
  commands:
    - bundle exec neeto-audit
```

And then execute:

    $ bundle install
