import Cocoa

class SparkleImage: LeapImage {
  let emitter = CAEmitterLayer()

  override init?(filename: String) {
    super.init(filename: filename)
    animationKeyPath = "emitterPosition"
  }

  func addAnimation(_ seconds: Double, path: CGMutablePath, animationDelay: Double) {
    super.addAnimation(seconds, path: path, layer: emitter, animationDelay: animationDelay)
  }

  func configureEmitter(_ imageSize: CGSize, seconds: Float) {
    let base = 0.2

    emitter.emitterPosition = CGPoint(x: -imageSize.width, y: -imageSize.height)
    emitter.emitterSize = CGSize(width: imageSize.width / 1.5, height: imageSize.height / 1.5)

    let sparkle = CAEmitterCell()
    sparkle.contents = image
    sparkle.birthRate = 20.0 / seconds + 15.0
    sparkle.lifetime = seconds * 0.5 + Float(base)
    sparkle.lifetimeRange = 1.5
    sparkle.name = "sparkle"
    sparkle.color = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    sparkle.greenSpeed = -0.7
    sparkle.minificationFilter = convertFromCALayerContentsFilter(CALayerContentsFilter.nearest)
    sparkle.alphaSpeed = -1.0
    sparkle.scale = 0.8
    sparkle.scaleRange = 0.5
    sparkle.scaleSpeed = CGFloat(sparkle.alphaSpeed - Float(base))
    sparkle.velocity = -20.0
    sparkle.velocityRange = 20.0
    sparkle.yAcceleration = -100.0
    sparkle.xAcceleration = -50.0
    sparkle.spin = -2.0
    sparkle.spinRange = 4.0

    emitter.renderMode = .additive
    emitter.emitterShape = .cuboid
    emitter.emitterCells = [sparkle]
  }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromCALayerContentsFilter(_ input: CALayerContentsFilter) -> String {
	return input.rawValue
}
