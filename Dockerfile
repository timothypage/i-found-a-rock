FROM elixir:1.5

RUN mkdir /app

WORKDIR /app

COPY mix.exs /app/mix.exs
COPY mix.lock /app/mix.lock

RUN mix local.hex --force
RUN mix local.rebar --force

RUN mix deps.get

COPY . /app


EXPOSE 4000

CMD ["mix", "phx.server"]
