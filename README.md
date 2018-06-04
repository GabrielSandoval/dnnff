# Dnnff
DNNFF is a Rails Plugin that allows you to load weights and biases of trained AI models and perform Deep Neural Network Feed Forward propagation.

You can now do AI predictions on your Rails app!

See example Rails application: [DNNFF Rails Example](https://github.com/GabrielSandoval/dnnff_rails_example)

## Usage
1. Create an AI model and include the `Dnnff::ActsAsDnnModeler` module.
```
# app/models/trading_bot.rb

class TradingBot < ApplicationRecord
  Dnnff::ActsAsDnnModeler
  self.abstract_class = true
end
```

2. In your AI model, add `acts_as_dnn_modeler` and set the Deep Neural Network architecture.
```
# app/models/trading_bot.rb

class TradingBot < ApplicationRecord
  include Dnnff::ActsAsDnnModeler

  acts_as_dnn_modeler architecture: [
    [5, ''],
    [128, 'relu'],
    [256, 'relu'],
    [512, 'relu'],
    [256, 'relu'],
    [128, 'relu'],
    [3, 'softmax']
  ], output_classes: ['buy', 'sell', 'hold']

  self.abstract_class = true
end
```

3. Place weights and biases json file on `app/ai_variables/trading_bot/` 
```
# app/ai_variables/trading_bot/weights.json
[[[-0.017977211624383926, 0.02516244351863861, ..., 0.020344866439700127]]]
```

```
# app/ai_variables/trading_bot/biases.json
[[-0.00859798863530159, 0.0, -0.0036201111506670713, ..., 0.0, -0.028109053149819374]]
```

4. Use the `#predict` method.
```
TradingBot.predict([[1,2,3,4,5]])
 => {:output_layer=>[0.6602635194126928, 0.33973568315229913, 7.974350082273843e-07], :prediction=>0, humanized_prediction=>"buy"}
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'dnnff'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install dnnff
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
