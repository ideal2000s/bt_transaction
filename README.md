# README

api endpoint: 'api/v1/largest_unconfirmed_transactions', method: get

rake task: 'bundle exec rake block_chain:import_largest_unconfirmed_transaction'

cron job: it used 'whenever' gem to run the above task recurringly in local env.


- if you want to run the cron job in kubernetes in another way, you might add the following codes to the kubernetes config file.

    
    server-cron-import-largest-unconfirmed-transaction: &cron
    
        type: cron
        
        schedule: */5 * * * *
        
        command:
        
        - bundle
    
        - exec
        
        - rake
        
        args:
        
            - block_chain:import_largest_unconfirmed_transaction

* Ruby version

    3.0.1

* Rails version

    6.1.4

* DB setup

    rails db:setup
    
    bundle exec rake db:migrate
    
* Run server

    rails s    

* Run cron job

    whenever --update-crontab --set environment='development'

* Display cron tab

    crontab -l

* Wipe cron tab

    whenever task: bundle exec whenever --clear-crontab

* Authentication

    name: 'james'

    password: 'test1234'

* Test

    made unit tests by using Rspec 