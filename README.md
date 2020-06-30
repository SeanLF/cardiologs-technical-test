# Cardiologs technical test

## Instructions

The instructions can be found [here](./INSTRUCTIONS.md).

## Getting started

### Ruby version

2.7.1

### System dependencies

- docker
- (optional) dip.yml

### First step

Run the following command to setup the docker container.

```bash
dip provision
```

### Deployment instructions

```bash
dip rackup
```

### Opening the Bash shell in the container

```bash
dip bash
```

## Design

I tried to modularize my app as much as possible, using helpers, and a model.

### Gems

- rspec
- rubocop for styling
- sinatra

### Design choice

- Project created using sinatra, for a quick and simple ruby app. I used my [personal website](https://github.com/SeanLF/seanfloyd.ca) as a template.

- I used the [Ruby on Whales](https://evilmartians.com/chronicles/ruby-on-whales-docker-for-ruby-rails-development) guide by [Evil Martians](https://evilmartians.com/) to dockerize my app. I also used the [dip.yml](https://github.com/evilmartians/terraforming-rails/blob/master/examples/dockerdev/dip.yml) tool that they recommend.

- I opted for the ruby-alpine image to limit the size.

### Possible optimizations

To simplify my code, and to move as quickly as possible, I chose to iterate multiple times over the CSV data to obtain a particular result.
This could be optimized by computing the requested calculations in a single pass.

### Interpretation of questions

#### The number of P waves tagged "premature", as well as the number of QRS complexes tagged "premature"

Count the number of waves that are P or QRS, and that are tagged as premature.

#### The mean heart rate of the recording (Frequency at which QRS complexes appear).

The number of QRS complexes that appear, divided by the number of milliseconds that elapsed.

#### The minimum and maximum heart rate, each with the time at which they happened. As the date and the time of the recording are not included in the file, the client should be able to set them.

Get the QRS complex that has the smallest difference between its wave onset and offset.
Do the same but with the largest difference.

### Bonus question

> We want to efficiently host delineations online, and be able to quickly request a range of it (e.g. the record between 2 and 3pm on the third day). How would you achieve that ?

By hosting delineations, I assume that the CSV data is already stored somewhere (AWS for example).
We could host multiple versions of the same file over various ranges, thereby increasing our storage requirements.
Or find the first and the last row in the range requested, and only process those rows.

If the client sends a CSV file, we could pre-process the data on the browser (or client, whatever it may be) to reduce its size, and only send the required range to the server to be processed.
