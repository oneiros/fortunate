# fortunate

fortunate is a bare-bones, simple blog app. It is written using
[Lucky](https://luckyframework.org).

## Installation

1. Follow [Lucky's installation instructions](http://luckyframework.org/guides/installing.html#install-required-dependencies) to get the required depencies.
2. Create a PostgreSQL database `fortunate_production`.
3. Clone the git repo from https://github.com/oneiros/fortunate
4. Run `yarn install` and `shards install`
5. Migrate the database with `crystal run tasks.cr -- db.migrate`. Optionally run `crystal run tasks.cr -- db.create_sample_seeds` to create sample data including an initial user (admin@example.com:password).
6. Compile assets with `yarn prod`
7. Compile fortunate with `crystal build --release src/start_server.cr`

See [Lucky's deployment guides](https://luckyframework.org/guides/deploying/ubuntu)
for some additional / alternative ideas to get up and running.

## Configuration

fortunate can be configured using environment variables.

| Variable name | Default Value | Description |
| ------------- | ------------- | ----------- |
| LUCKY\_ENV     | development   | Lucky's environment. Set this to `production` for live installations. The default is fine if you want to improve the code. |
| DATABASE\_URL | "postgres:///fortunate\_\<environment\>" | The PostgreSQL-URL used to connect to your database |
| SECRET\_KEY\_BASE | none | Set this to a random string. You can use `crystal run tasks.cr -- gen.secret_key` to generate one. |
| APP\_DOMAIN | none | Set this to the base url of your domain, e.g. `https://blog.example.com` |
| FORTUNATE\_SITE\_NAME | "My Blog" | The name of your blog |

## Development

1. [Install required dependencies](http://luckyframework.org/guides/installing.html#install-required-dependencies)
1. Clone the git repo from https://github.com/oneiros/fortunate
1. Run `script/setup`
1. Run `lucky dev` to start the app

You can learn about Lucky from the [Lucky Guides](http://luckyframework.org/guides).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/oneiros/fortunate.

## License

The project is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT). See LICENSE.txt.
