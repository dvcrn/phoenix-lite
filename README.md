# Phoenix Lite

Simplified Phoenix Framework starter template

## What is this?

Phoenix Lite is a more simplified starting point for new [phoenix framework](https://www.phoenixframework.org) applications. 

Phoenix Framework is great, but the default when starting a new project contains a lot of boilerplate stuff that you may not need when starting out. It's also very opinionated.

This project is to reduce the boilerplate and give a more simplified starting point. It also changes some of the opinionated structual points and provides a more simplified straight-forward directory structure (no templates under controllers for example)

### What's different?

In the end, this is still just [phoenix framework](https://www.phoenixframework.org) and not a new thing. 

- No database/gettext/mailer: Most of the time not needed when starting out, and you can always add those back in later with minimal effort
- Simplified HTML template
- Added concise example how to render live views standalone or through a controller
- Added concise example how to render a non-live view through a controller
- Added example live-component with internal state tracking 
- Move controllers into `xxx_web/controllers`
- Move layouts into `xxx_web/layouts`
- Move liveviews into `xxx_web/live`
- Move views into `xxx_web/views`
- Move view templates into `xxx_web/views/templates`

## How to use this? 

Clone the project and run `rename_template.sh` with your project name to get everything setup:

```bash
./rename_template.sh myproject
```

## License

MIT