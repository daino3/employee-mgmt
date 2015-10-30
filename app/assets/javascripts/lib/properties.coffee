Function::property = (prop, desc) ->
  Object.defineProperty(this.prototype, prop, _.extend(desc, {configurable: true}))
