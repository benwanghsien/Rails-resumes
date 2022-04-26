import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"

import "channels"
import "scripts"
import "styles"
import "controllers"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

const images = require.context("../images", true)
const imagePath = (name) => images(name, true)
