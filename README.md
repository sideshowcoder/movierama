## Movierama

This is a tiny, demo application.

It is (yet another) social sharing platform where users can share their favorite
movies. Each movie has a title and a small description as well as a date that
corresponds to the date it was added to the database. In addition it holds a
reference to the user that submitted it. Users can also express their opinion
about a movie by either likes or hates.

### Getting started

#### Checking out the repository

Github has a nice link. Right there, on the right of your page!


#### Dependencies

Install Ruby 2.1.2 if necessary (if you use `rbenv`, it will yell at you if you
don't).

Run `bundler` as usual:

    $ bundle install

You will need an instance of Redis.  If you have a locally running Redis, things
should just work; otherwise change the value of `DB_URL` in `.env`.

Check that everything works by seeding the database with a few users and movies:

    $ ./bin/seed


#### Launching the app

As the application requires HTTPS, you will need a local setup that supports
that.

Follow [these instructions](http://dec0de.me/2014/10/pow-ssl/) if you usually
use Pow; otherwise:

Install `tunnelss`:

    $ gem install tunnelss

Run the SSL tunnel in a terminal:

    $ tunnelss 24676 24675

Run the application on the corresponding port:

    $ ./bin/rails server -p 24675

Then point your browser to https://127.0.0.1:24676

Enjoy!


#### Getting authentication to work

Login/signup use Omniauth with Github as a provider. If you're using Pow and the
`movierama.dev` host (recommended), you're all set.

If not, you'll need to get your own OAuth tokens from Github and edit
`.env` appropriately.


### Screenshot

So you know what to expect. This app's just a toy, remember?

![](https://dl.dropboxusercontent.com/spa/cbazgcyvth7jydp/-4eusn-o.png)

### Emails

Emails can be [pre-viewed](https://movierama.dev/rails/mailers) and are available
in html as well as text.

In development emails are sent via mailcatcher, to make this work mailcatcher
needs to be running `mailcatcher`. View the mails at
[the interface](http://127.0.0.1:1080) in a browser.

