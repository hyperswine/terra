/*
    3D Modeling
    - box modeling: simpler initially, setup more faster and focus on the key parts, sculpt later
    - vertex modeling: more control initially, potential for better foundation

    possible for concept art -> 3d model generation and prompt based refinement? (dont generate directly because of lawsuits)
*/

use std::ml::[MLModel NeuralNet conv_neural_net]
use std::graphics::Color

// BTW: instead of word wrap on rein, you can also choose truncate to ... for content
// then on hover, it'll show it or wrap it in a quick expand
// might be good for notebooks

// annotations are defined as macros with an @ in front

@derive(Serialize)
AutoModel: {
    // MLModel has variants NeuralNet, SVM, DecisionTree, etc... You can autocast any variant to he base variant
    // since the base variant is sized as the largest variant
    model: MLModel

    # constructor
    # the thing you can do with this is generate your models, refine them, then add them back to the trainer
    train: (art: &[(Texture, Model)]) -> Self {
        // setup neural net with random hyperparams
        let model = NeuralNet(model_type=Convolutional, train_data_type=Batch)

        // batch process the images as one big image and also the 3d models as a flat array of verticess
        let res = art.reduce(acc, next => acc + next)
        model.train(res)

        Self {model}
    }

    # use the current ml model to convert a 2d texture to a 3d mesh
    generate: (&self, concept_art: Texture) {
        self.model.query(query=Generate, concept_art.data())
    }

    # constructor from path (serialised ml model?)
    load_ml_model: (path: Path) -> Self {
        std::deserialize(std::read(path))
    }

    # this function will overwrite whatever is at path or create a new file there (including any parent dirs)
    # so be careful
    save_ml_model: (&self, path: Path) -> Status {
        let bytes = std::serialize(self)
        std::write(path, bytes)?
    }

    # refine a model's specifications using natural language prompts
    refine: (&self, query: Query, model3d: Model) -> Model {
        self.model.query(query, model3d)
    }
}

Texture: {
    spec: Vec[Color]

    # 1-dimensional array
    Add: impl (self, rhs: Self) -> Self {
        // basically, join together x1, y1 and x2, y2 into x3, y3 (1D array?)
        let res = self.data() + rhs.data()
    }

    data: (self) -> &[u8] {
        self.spec.serialize()
    }
}

Material: Texture | Normal | AmbientOcclusion
