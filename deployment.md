# Set environment variables

mix phx.gen.secret
REALLY_LONG_SECRET
export SECRET_KEY_BASE=REALLY_LONG_SECRET
export DATABASE_URL=ecto://USER:PASS@HOST/database

# Initial setup

mix deps.get --only prod
MIX_ENV=prod mix compile

# Compile assets

MIX_ENV=prod mix assets.deploy

_----- ELIXIR INSTALLED -----_

# Custom tasks (like DB migrations)

MIX_ENV=prod mix ecto.migrate

# Finally run the server

PORT=4001 MIX_ENV=prod mix phx.server

_----- SELF CONTAINED DIRECTORY -----_

# Create a release

mix phx.gen.release

# Generating a dockerfile

mix phx.gen.release --docker
