import UIKit

class YKParallaxHeaderView: UIView {
    let imageView: UIImageView
    let defaultHeight: CGFloat
    
    init(image: UIImage!, height: CGFloat!, inView: UIScrollView!) {
        let appFrame: CGRect = UIScreen.mainScreen().applicationFrame
        imageView = UIImageView(frame: CGRectMake(0.0, 0.0, appFrame.width, height))
        defaultHeight = height

        super.init(frame: imageView.frame)
        self.frame.origin.y = -defaultHeight
        
        imageView.image = image
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        imageView.clipsToBounds = true

        self.addSubview(imageView)

        inView.addSubview(self)
        inView.contentInset = UIEdgeInsetsMake(defaultHeight, 0.0, 0.0, 0.0)
        inView.addObserver(self, forKeyPath: "contentOffset", options: NSKeyValueObservingOptions.New, context: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if keyPath == "contentOffset" {
            let offset: CGPoint! = change[NSKeyValueChangeNewKey]?.CGPointValue()
            self.frame.origin.y = offset.y
            self.frame.size.height = offset.y * -1
        }
    }
}
