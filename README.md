                        -- Faculty Management Portal --

To launch portal, the steps that are needed to follow are:
- start virtualenvironment
  from the directory where virtualenvironment is present, use:

    source virtualenv/bin/activate

- launch the django server and run the django application.
  from the application location, use:

    python manage.py runserver

this will launch the portal at http://127.0.0.1:8000

* to change the address port use: python manage.py runserver 3444


The CSS used for template is Responsive(Mobile First) hence can be used with ease
on any screen size without distortion.

This portal is capable of:
    -> adding new faculty to database, where his data is added to tables
    (personalInfo, phone_num, email, credentials, department)

    -> log in of pre-existing user, there after he has options of updating
       address, and adding to supervises table where user can add the id of supervisor
       and the task.

    -> new entries of previous records can be added using django-admin.
