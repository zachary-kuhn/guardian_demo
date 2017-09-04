# GuardianDemo

This project provides the minimal setup for Guardian 1.X in a Phoenix application.

## Prerequisites

You need Elixir and Phoenix installed.

### Mac OSX (Homebrew)

```
$ brew install elixir
```

### Debian/Ubuntu

```
$ wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
$ sudo apt-get update
$ sudo apt-get install esl-erlang
$ sudo apt-get install elixir
```

### Fedora

```
$ dnf install elixir
```

### Windows (Chocolatey)

```
$ cinst elixir
```

For additional installation options, check out the excellent documentation at [the official Elixir page](https://elixir-lang.org/install.html).

To get Phoenix, run the following commands.

```
$ mix local.hex
$ mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez
```

The [full installation instructions](https://hexdocs.pm/phoenix/installation.html) can be found at the official Phoenix project documentation.

## Installing

To get started with the project, you will need to install its dependencies.

```
$ mix deps.get
```

After that completes, you need to add a secret to the `GUARDIAN_DEMO_SECRET_KEY` environment variable.

```
$ mix guardian.gen.secret

*YOUR_SECRET_KEY*

$ export GUARDIAN_DEMO_SECRET_KEY=*YOUR_SECRET_KEY*
```

Now you can start the server.

```
$ mix phx.server
```

### Testing

You can test the server using CURL.

```
$ curl -c cookies.txt --request POST \
  --url http://localhost:4000/api/users/sign-in \
  --header 'content-type: application/json' \
  --data '{ "password": "password" }'

$ curl -b cookies.txt --request GET \
  --url http://localhost:4000/api/users/me \
  --header 'content-type: application/json'

$ curl -b cookies.txt -c cookies.txt --request POST \
  --url http://localhost:4000/api/users/sign-out \
  --header 'content-type: application/json'
```

## Built With

  * [Elixir](https://github.com/elixir-lang/elixir) v1.5.1 - The programming language
  * [Phoenix](https://github.com/phoenixframework/phoenix) v1.3.0 - The web framework
  * [Guardian](https://github.com/ueberauth/guardian) v1.0-beta - The authentication library

## Authors

  * *Zach Kuhn* - [zachary-kuhn](https://github.com/zachary-kuhn)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
