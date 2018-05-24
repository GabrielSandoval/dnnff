module Dnnff
  module ActsAsDnnModeler
    extend ActiveSupport::Concern

    class_methods do
      cattr_accessor :architecture
      cattr_accessor :layers
      cattr_accessor :output_classes
      cattr_accessor :w
      cattr_accessor :b

      def acts_as_dnn_modeler(options = {})
        @architecture = options[:architecture]
        @output_classes = options[:output_classes]
        @layers = []
        @w = load_weights
        @b = load_biases
      end

      def load_weights
        filename = "app/ai_variables/#{self.to_s.underscore}/weights.json"
        file = File.read(filename)
        @w = JSON.parse(file)
      end

      def load_biases
        filename = "app/ai_variables/#{self.to_s.underscore}/biases.json"
        file = File.read(filename)
        @b = JSON.parse(file)
      end

      def predict(features = [])
        @layers[0] = features
        @architecture.each_with_index do |t, i|
          if i != (@architecture.size - 1)
            @layers[i + 1] = ((Matrix[*@layers[i]] * Matrix[*@w[i]]) + Matrix[@b[i]]).to_a.map do |m|
              # Activation Function
              send(@architecture[i+1][1], m)
            end
          end
        end

        output_layer = @layers.last.flatten
        prediction = output_layer.flatten.each_with_index.max[1]

        return {output_layer: output_layer, prediction: prediction, humanized_prediction: @output_classes[prediction]}
      end

      def relu(layer)
        layer.map { |x| x > 0 ? x.to_f : 0.0 }
      end

      def softmax(layer)
        sum = layer.inject(0){|acc, x| acc += Math.exp(x) }
        layer.map { |x| Math.exp(x)/sum }
      end
    end
  end
end
