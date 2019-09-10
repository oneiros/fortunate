require "./shards"

# Load the asset manifest in public/mix-manifest.json
Lucky::AssetHelpers.load_manifest

require "./markd/**"
require "./app_database"
require "./models/base_model"
require "./models/mixins/**"
require "./models/**"
require "./queries/mixins/**"
require "./queries/**"
require "./operations/mixins/**"
require "./operations/**"
require "./serializers/**"
require "./emails/base_email"
require "./emails/**"
require "./actions/mixins/**"
require "./actions/**"
require "./components/base_component"
require "./components/**"
require "./pages/**"
require "../config/env"
require "../config/**"
require "../db/migrations/**"
require "./app_server"
