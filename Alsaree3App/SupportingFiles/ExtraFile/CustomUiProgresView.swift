import UIKit

class CustomProgressView: UIView {
    
    let backView = UIView()
    let progressView = UIView()
    let dividerView = UIView()
    
    var progress: CGFloat = 0 {
        didSet {
            updateProgress()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        // Back View
        let backViewHeigth:CGFloat = 10
        backView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: backViewHeigth)
        backView.backgroundColor = UIColor.white
        backView.layer.cornerRadius = backViewHeigth/2
        addSubview(backView)
        
        // Progress View
        let progressHeight: CGFloat = 15
        let centerY = (backView.frame.height - progressHeight) / 2.0
        progressView.frame = CGRect(x: 0, y: centerY, width: 0, height: progressHeight)
        
        progressView.backgroundColor = ColorConstant.primaryYellowColor
        progressView.layer.cornerRadius = progressHeight/2
        progressView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        addSubview(progressView)
        
        // Divider View
        let dividerHeight: CGFloat = 30
        let dividerY = (backView.frame.height - dividerHeight) / 2.0
        dividerView.frame = CGRect(x: 0, y: dividerY, width: 2.5, height: dividerHeight)
        dividerView.layer.cornerRadius = 2.5/2
        dividerView.backgroundColor = UIColor.black
        addSubview(dividerView)
        
        // Set initial progress
        updateProgress()
    }
    
    
    private func updateProgress() {
        let progressWidth = bounds.width * progress
        let dividerX = progressWidth - 0.5
        
        // Animate progress and divider
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: .curveLinear) {
            self.progressView.frame.size.width = progressWidth
            self.dividerView.frame.origin.x = dividerX
        }
    }
}
