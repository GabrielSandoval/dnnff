class TradingBot < ApplicationRecord
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
