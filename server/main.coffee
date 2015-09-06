express             = require 'express'
bodyParser          = require 'body-parser'
clientSessions      = require 'client-sessions'
db                  = require './db.coffee'
_                   = require 'lodash'

app = express()
app.use express.static './public'
app.use bodyParser.json()
app.use bodyParser.urlencoded extended: false
app.use clientSessions
  cookieName: 'TonyCodesSession'
  secret: 'thisshitisbananasbeeayyennayyennayyess'

app.set 'views', __dirname + '/views'
app.set 'view engine', 'jade'

app.get '/', (req, res) -> res.render 'main', {theme: db.appSetings.theme}

app.get '/api', (req, res) -> res.json {
    navlinks: db.navlinks
    images: db.images
    documents: db.documents
  }

app.get '/category/:categoryId', (req, res) ->
  category = _.find db.categories, guid: req.params.categoryId

  return res.json {

    articles: _.filter db.articles, (article) ->
      return category.articles.indexOf(article.guid) != -1

    subCategories: _.filter db.subCategories, (subCategory) ->
      return category.subCategories.indexOf(article.guid) != -1

  }


app.get '/designer', (req, res) -> res.render 'designer', {theme: db.appSettings.theme}

server = app.listen 3000
