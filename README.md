# GO Rails Template

A template to build large scale web applications in Ruby On Rails. Focus on extending, performance and best practices by applying patterns: Service Objects, Form Objects, Query Objects, Calculation Objects, Value Objects, Policy Objects, Decorators, etc.

<p align="center">
  <img src="https://raw.githubusercontent.com/GoldenOwlAsia/go_rails_template/master/app/assets/images/welcome.png" alt="react boilerplate banner" width="600" />
<p>

<br />

<div align="center">
  <sub>Created by <a href="https://github.com/tranquangvu">Ben Tran</a> with ❤️</sub>
</div>

## General Information

- Ruby version: `ruby 2.6.3`
- Rails version: `rails 5.2.3`
- Database: `postgresql`

## Features

- Rubocop config
- Codeclimate config
- Basic [devise](https://github.com/plataformatec/devise) authentication setup
- View template render by [slim](http://slim-lang.com/)
- Support Javascript ES6 in Assets Pipeline
- Page-specific Javascript with [punchbox](https://github.com/GoldenOwlAsia/punchbox)
- Easier form helpers with [simple_form](https://github.com/plataformatec/simple_form)
- Pagination with [kaminari](https://github.com/kaminari/kaminari)
- PDF generator with [wicked_pdf](https://github.com/mileszs/wicked_pdf)
- Email preview in the browser instead of sending with [letter_opener](https://github.com/ryanb/letter_opener)
- CSS styled email without the hassle with [premailer-rails](https://github.com/fphilipe/premailer-rails)
- Annotate rails classes with schema and routes info [annotate_models](https://github.com/ctran/annotate_models)
- Performance checking in development environment with [bullet](https://github.com/flyerhzm/bullet) and [rack-mini-profiler](https://github.com/MiniProfiler/rack-mini-profiler)
- Environment variables loading with [dotenv](https://github.com/bkeepers/dotenv)
- [Sidekiq](https://github.com/mperham/sidekiq) default for Active Job queue adapter
- [Carrierwave](https://github.com/carrierwaveuploader/carrierwave) file upload (development, test evironments: local file storage - staging, production: AWS S3 fog storage)
- Full settings for testing application: [rspec](https://rspec.info/), [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails), [faker](https://github.com/stympy/faker), [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers), [webmock](https://github.com/bblimke/webmock), [vcr](https://github.com/vcr/vcr)
- Error tracking config in production with Sentry
- Base class init for common patterns in rails application: Service Objects, Form Objects, Query Objects, Calculation Objects, Value Objects, Policy Objects, Decorators, etc

## Quick Start

1. Make sure that you have installed ruby, rails, redis and postgresql. Read [this guide](https://gorails.com/setup) to install if you don't have.
2. Clone this repo using `git clone --depth=1 git@github.com:GoldenOwlAsia/go_rails_template.git <YOUR_PROJECT_NAME>`
3. Move to the appropriate directory: `cd <YOUR_PROJECT_NAME>`
4. Install correct ruby version for our project. If you have `rbenv`, use these commands:

```
rbenv install 2.6.3
rbenv local 2.6.3
```

5. Install bundler: `gem install bundler`
6. Install gems: `bundle install`
7. Add database config: create `config/database.yml` file (refer from `config/database.yml.example`)
8. Add environment variables: create `.env` file (refer from `.env.example`)
9. Database setup: `bundle exec rake db:setup`
10. Run sidekiq (make sure redis service is running): `bundle exec sidekiq`
11. Start server: `rails s`
12. Visit `http://localhost:3000` and start your development

## Testing

1. Start to run your specs by: `bundle exec rspec`
2. See coverage by open `coverage/index.html` in web browser

## Main Structure

```
  app
  ├── assets
  │   ├── javascripts
  │   │   ├── application.js.es6
  │   │   ├── cable.js.es6
  │   │   ├── channels
  │   │   └── views
  │   │       └── home.js.es6
  │   └── stylesheets
  │       └── views
  │       │   ├── home.scss
  │       │   └── variables.scss
  │       ├── common
  │       │   ├── fonts.scss
  │       │   └── variables.scss
  │       └── application.scss
  ├── calculations
  │   └── application_calculation.rb
  ├── controllers
  │   ├── concerns
  │   ├── application_controller.rb
  │   └── home_controller.rb
  ├── decorators
  │   ├── application_decorator.rb
  │   └── paginating_decorator.rb
  ├── forms
  │   └── application_form.rb
  ├── helpers
  │   └── application_helper.rb
  ├── jobs
  │   └── application_job.rb
  ├── mailers
  │   └── application_mailer.rb
  ├── models
  │   ├── concerns
  │   └── application_record.rb
  ├── policies
  │   └── application_policy.rb
  ├── queries
  │   └── application_query.rb
  ├── services
  │   └── application_service.rb
  ├── value_objects
  │   └── application_value_object.rb
  └── views
      ├── devise
      ├── home
      ├── layouts
      └── shared
```

## Common Patterns

In software engineering, a software design pattern is a general, reusable solution to a commonly occurring problem within a given context in software design. It is not a finished design that can be transformed directly into source or machine code. It is a description or template for how to solve a problem that can be used in many different situations. Design patterns are formalized best practices that the programmer can use to solve common problems when designing an application or system.

#### Service Objects

Service objects are commonly used to mitigate problems with model callbacks that interact with external classes ([read more](https://samuelmullen.com/2013/05/the-problem-with-rails-callbacks/)). Service objects are also useful for handling processes involving multiple steps. E.g. a controller that performs more than one operation on its subject (usually a model instance) is a possible candidate for Extract ServiceObject (or Extract FormObject) refactoring. In many cases service object can be used as scaffolding for [replace method with object refactoring](https://sourcemaking.com/refactoring/replace-method-with-method-object). Some more information on using services can be found in [this article](https://medium.com/selleo/essential-rubyonrails-patterns-part-1-service-objects-1af9f9573ca1).

Defining:

```
class ActivateUserService < ApplicationService
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def call
    user.activate!
    NotificationsMailer.user_activation_notification(user).deliver_later
    user
  end
end
```

Usage:

```
user = User.find(params[:id])
ActivateUserService.call(user)
```

#### Form Objects

Form objects, just like service objects, are commonly used to mitigate problems with model callbacks that interact with external classes ([read more](https://samuelmullen.com/2013/05/the-problem-with-rails-callbacks/)). Form objects can be used as wrappers for virtual (with no model representation) or composite (saving multiple models at once) resources. In the latter case this may act as replacement for ActiveRecord::NestedAttributes. In some cases FormObject can be used as scaffolding for [replace method with object refactoring](https://sourcemaking.com/refactoring/replace-method-with-method-object). Some more information on using form objects can be found [in this article](https://medium.com/selleo/essential-rubyonrails-patterns-form-objects-b199aada6ec9).

Defining:

```
class UserRegistrationForm < ApplicationForm
  attr_accessor :user, :terms_of_service

  delegate :attributes=, to: :user, prefix: true

  validates :terms_of_service, acceptance: true

  def initialize(user, params = {})
    @user = user
    super(params)
  end

  def submit
    return false if invalid?
    user.save
  end

  def persisted?
    user.persisted?
  end
end
```

Usage:

```
user = User.new
form = UserRegistrationForm.new(user, permitted_params)
form.submit
```

#### Query Objects

One should consider using query objects pattern when in need to perform complex querying on active record relation. Usually one should avoid using scopes for such purpose. As a rule of thumb, if scope interacts with more than one column and/or joins in other tables, it should be moved to query object. Also whenever a chain of scopes is to be used, one should consider using query object too. Some more information on using query objects can be found in [this article](https://medium.com/selleo/essential-rubyonrails-patterns-part-2-query-objects-4b253f4f4539).

Defining:
```
class RecentlyActivatedUsersQuery < ApplicationQuery
  query_on 'User'

  def call
    relation.active.where(activated_at: date_range)
  end

  private

  def date_range
    options.fetch(:date_range, default_date_range)
  end

  def default_date_range
    Date.yesterday.beginning_of_day..Date.current.end_of_day
  end
end
```

Usage:
```
RecentlyActivatedUsersQuery.call
RecentlyActivatedUsersQuery.call(date_range: Date.today.beginning_of_day..Date.today.end_of_day)
RecentlyActivatedUsersQuery.call(User.male, date_range: Date.today.beginning_of_day..Date.today.end_of_day)
```

#### Calculation Objects

Calculation objects provide a place to calculate simple values (i.e. numeric, arrays, hashes), especially when calculations require interacting with multiple classes, and thus do not fit into any particular one.

Defining:
```
class AverageHotelDailyRevenueCalculation < ApplicationCalculation
  def call
    reservations.sum(:price) / number_of_days_in_year
  end

  private

  def reservations
    Reservation.where(
      date: (beginning_of_year..end_of_year),
      hotel_id: options[:hotel_id]
    )
  end

  def number_of_days_in_year
    end_of_year.yday
  end

  def year
    options[:year] || Date.current.year
  end

  def beginning_of_year
    Date.new(year).beginning_of_year
  end

  def end_of_year
    Date.new(year).end_of_year
  end
end
```

Usage:
```
hotel = current_user.owned_hotel
AverageHotelDailyRevenueCalculation.call(hotel_id: hotel.id)
AverageHotelDailyRevenueCalculation.call(hotel_id: hotel.id, year: 2018)
```

#### Value Objects

The Value Object design pattern encourages simple, small objects (which usually just contain given values), and lets you compare these objects according to a given logic or simply based on specific attributes (and not on their identity).

Read more at [value_objects document](https://github.com/GoldenOwlAsia/value_objects).

Defining:
```
class AddressValueObject < ApplicationValueObject
  attr_accessor :street, :postcode, :city

  validates :postcode, presence: true
  validates :city, presence: true
end
```

Usage:

```
address = AddressValueObject.new(street: '123 Big Street', city: 'Metropolis')
address.valid? # => false
address.errors.to_h # => {:postcode=>"can't be blank"}
address.postcode = '12345' # => "12345"
address.valid? # => true
address.errors.to_h # => {}
```

Usage in Active Record:
```
class User < ActiveRecord::Base
  include ValueObjects::ActiveRecord

  value_object :company_addresses, AddressValueObject::Collection
  value_object :home_address, AddressValueObject
end
```

#### Policy Objects

The Policy Objects design pattern is similar to Service Objects, but is responsible for read operations while Service Objects are responsible for write operations. Policy Objects encapsulate complex business rules and can easily be replaced by other Policy Objects with different rules. For example, we can check if a guest user is able to retrieve certain resources using a guest Policy Object. If the user is an admin, we can easily change this guest Policy Object to an admin Policy Object that contains admin rules.

Read more at [pundit document](https://github.com/varvet/pundit).

Defining:
```
class ArticlePolicy < ApplicationPolicy
  def create?
    user.admin?
  end

  def update?
    user.admin? && !record.published?
  end
end
```

Usage:
```
@article = Article.find(params[:id])
authorize @article, :update?
@article.update(article_params)
```


#### Decorators

The Decorator Pattern allows us to add any kind of auxiliary behavior to individual objects without affecting other objects of the same class. This design pattern is widely used to divide functionality across different classes, and is a good alternative to subclasses for adhering to the Single Responsibility Principle.

Read more at [draper document](https://github.com/drapergem/draper).

Define:
```
class ArticleDecorator < Draper::Decorator
  delegate_all

  def publication_status
    if published?
      "Published at #{published_at}"
    else
      "Unpublished"
    end
  end

  def published_at
    object.published_at.strftime("%A, %B %e")
  end
end
```

Usage:
```
article = Article.find(params[:id]).decorate
article.publication_status
article.published_at
```

## Deployment

For deployment, you can use AWS Elastic Beanstalk Service (AWS EB) which have most interesting parts from my experiences:
- Handles the deployment process, you just need to bundle the app and send to EB then you’re free to do others thing. Don’t need to wait for processing tasks via SSH connection, as result in speed up your development.
- Handles load balancing, auto-scaling by triggered to the app health monitoring. You can easy to setting up from EB management console.
- And finally, no additional charge for using EB. If you are using the same resources (EC2, CloudFront, S3, RDS, Route 53, ElasticCache,…) then EB won’t add more charges to your bill.

I have written [a complete guide to deploy rails application to AWS EB](https://github.com/tranquangvu/dev-notes/tree/master/deploys-rails-to-awseb). Please take a look on it.

## License

Licensed under the MIT license, see the separate LICENSE.md file.
