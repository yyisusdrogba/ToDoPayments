//
//  CardViewController.swift
//  ToDoPayments
//
//  Created by Jesus Gonzalez on 12/11/24.
//

import UIKit

protocol CardViewProtocol{
    func succes()
    func error()
}

class CardViewController: UIViewController {
    
    var category = ""
    var image = ""
    var presenter: CardPresenterProtocol?
    
    let imagePayment: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "dollarsign")
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isUserInteractionEnabled = true
        return image
    }()
    
    let textFieldPrice: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Price"
        textField.textColor = .black
        textField.tag = 2
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    let textFieldName: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Name of the payment"
        textField.textColor = .black
        textField.tag = 0
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    let labelCategory: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Category:"
        label.textColor = .white
        
        return label
    }()
    
    let categoryPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.tintColor = .white
        return picker
    }()
    
    let labelDateLimit: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Date limit:"
        label.textColor = .white
        return label
    }()
    
    let dateLimit: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.minimumDate = .now
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.preferredDatePickerStyle = .compact
        datePicker.backgroundColor = UIColor(white: 0.6, alpha: 0.9)
        return datePicker
    }()
    
    let labelForPerson: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pago dividido entre mas personas:"
        label.textColor = .white
        return label
    }()
    
    let toggleForPerson: UISwitch = {
        let toggleSwitch = UISwitch()
        toggleSwitch.translatesAutoresizingMaskIntoConstraints = false
        toggleSwitch.addTarget(self, action: #selector(switchToggled(_:)), for: .touchUpInside)
        return toggleSwitch
    }()
    
    let numberOfPersons: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Entre cuantas personas se divide el pago:"
        label.isHidden = true
        label.textColor = .white
        return label
    }()
    
    let numberOfPersonsWritten: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "2"
        textField.isHidden = true
        textField.tag = 1
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 2
        return textField
    }()
    
    let payForPerson: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.isHidden = true
        label.textColor = .white
        return label
    }()
    
    let buttonSave: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(savePayment), for: .touchUpInside)
        button.layer.cornerRadius = 4
        return button
    }()
    
    let firstHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let secondHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let thirdHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        presenter = CardPresenter(cardViewProtocol: self)
        initComponents()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        presenter = CardPresenter(cardViewProtocol: self)
    }
    
    @objc func showImageCollect () {
        let imageCollectionViewController = ImageCollectionViewController()
        imageCollectionViewController.modalPresentationStyle = .fullScreen
        imageCollectionViewController.modalTransitionStyle = .crossDissolve
        imageCollectionViewController.view.backgroundColor = UIColor(white: 0, alpha: 0.6)
        imageCollectionViewController.imageSelectionProtocol = self
        present(imageCollectionViewController, animated: true)
    }
    
    @objc func savePayment() {
        guard let textFieldNameFull = textFieldName.text else {return}
        if textFieldName.text != nil && textFieldPrice.text != "" && category != "" && image != ""{
            if toggleForPerson.isOn {
                presenter?.createPayment(model: ModelPaymentCard(image: image, name: textFieldName.text!, category: category, price: textFieldPrice.text!, dateLimit:dateLimit.date.formatted(.dateTime.day().month().year()) , paymentForPerson: payForPerson.text))
            } else {
                presenter?.createPayment(model: ModelPaymentCard(image: image, name: textFieldName.text!, category: category, price: textFieldPrice.text!, dateLimit:dateLimit.date.formatted(.dateTime.day().month().year()) , paymentForPerson: nil))
                self.dismiss(animated: true)
            }
        }
    }
    
    @objc func switchToggled(_ sender: UISwitch) {
        if sender.isOn {
            payForPerson.isHidden = false
            numberOfPersons.isHidden = false
            numberOfPersonsWritten.isHidden = false
        } else {
            payForPerson.isHidden = true
            numberOfPersons.isHidden = true
            numberOfPersonsWritten.isHidden = true
        }
    }
    
    func initComponents () {
        
        //TAP EVENTS
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        let tapGestureImage = UITapGestureRecognizer(target: self, action: #selector(showImageCollect))
        imagePayment.addGestureRecognizer(tapGestureImage)
        
        //ADD DELEGATES
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        
        textFieldName.delegate = self
        textFieldPrice.delegate = self
        numberOfPersonsWritten.delegate = self
        
        
        
        //ADD CONSTRAINS IN THE COMPONENTS
        view.addSubview(imagePayment)
        view.addSubview(textFieldPrice)
        view.addSubview(textFieldName)
        view.addSubview(labelCategory)
        view.addSubview(categoryPicker)
        view.addSubview(firstHorizontalStackView)
        
        firstHorizontalStackView.addArrangedSubview(labelDateLimit)
        firstHorizontalStackView.addArrangedSubview(dateLimit)
        
        view.addSubview(secondHorizontalStackView)
        
        secondHorizontalStackView.addArrangedSubview(labelForPerson)
        secondHorizontalStackView.addArrangedSubview(toggleForPerson)
        
        view.addSubview(thirdHorizontalStackView)
        
        thirdHorizontalStackView.addArrangedSubview(numberOfPersons)
        thirdHorizontalStackView.addArrangedSubview(numberOfPersonsWritten)
        
        view.addSubview(payForPerson)
        view.addSubview(buttonSave)
        
        NSLayoutConstraint.activate([
            
            imagePayment.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 26),
            imagePayment.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            imagePayment.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            imagePayment.heightAnchor.constraint(equalToConstant: 100),
            imagePayment.widthAnchor.constraint(equalToConstant: 100),
            
            textFieldName.topAnchor.constraint(equalTo: imagePayment.bottomAnchor, constant: 10),
            textFieldName.heightAnchor.constraint(equalToConstant: 30),
            textFieldName.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            textFieldName.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            textFieldPrice.topAnchor.constraint(equalTo: textFieldName.bottomAnchor,constant: 26),
            textFieldPrice.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            textFieldPrice.heightAnchor.constraint(equalToConstant: 30),
            textFieldPrice.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            secondHorizontalStackView.topAnchor.constraint(equalTo: textFieldPrice.bottomAnchor, constant: 14),
            secondHorizontalStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            secondHorizontalStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            secondHorizontalStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            thirdHorizontalStackView.topAnchor.constraint(equalTo: secondHorizontalStackView.bottomAnchor, constant: 14),
            thirdHorizontalStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            thirdHorizontalStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            thirdHorizontalStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.86),
            
            labelCategory.topAnchor.constraint(equalTo: thirdHorizontalStackView.bottomAnchor,constant: 12),
            labelCategory.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            labelCategory.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            categoryPicker.topAnchor.constraint(equalTo: labelCategory.bottomAnchor),
            categoryPicker.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            categoryPicker.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            firstHorizontalStackView.topAnchor.constraint(equalTo: categoryPicker.bottomAnchor),
            firstHorizontalStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            firstHorizontalStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            firstHorizontalStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            
            payForPerson.topAnchor.constraint(equalTo: firstHorizontalStackView.bottomAnchor, constant: 14),
            payForPerson.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            payForPerson.heightAnchor.constraint(equalToConstant: 30),
            payForPerson.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            buttonSave.topAnchor.constraint(equalTo: payForPerson.bottomAnchor, constant: 14),
            buttonSave.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            buttonSave.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        ])
    }
    
}

extension CardViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return HomeDataManager().getCategoryForPicker().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return HomeDataManager().getCategoryForPicker()[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        category = HomeDataManager().getCategoryForPicker()[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let text = HomeDataManager().getCategoryForPicker()[row]
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white
        ]
        return NSAttributedString(string: text, attributes: attributes)
    }
    
}

extension CardViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textUnwrapped = textField.text else { return false }
        guard let rangeConvert = Range(range, in: textUnwrapped) else {return false}
        let replacingText = textUnwrapped.replacingCharacters(in: rangeConvert, with: string)
        switch textField.tag {
        case 0:
            return replacingText.count < 30
        case 1:
            guard let floatText = Float(replacingText) else {return false}
            return floatText >= 1 && floatText <= 99
        case 2:
            guard let floatText = Float(replacingText) else {return false}
            return floatText >= 1 && floatText <= 99999
        default :
            return true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        payForPerson.text = "\(presenter?.operationOfPaymentDivided(price: textFieldPrice.text ?? "0", numberOfPersons: textField.text ?? "0"))"
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField.tag {
        case 1:
            textField.keyboardType = .numberPad
        case 2:
            textField.keyboardType = .numberPad
        default:
            textField.keyboardType = .default
        }
    }
    
}

extension CardViewController: ImageSelectionProtocol {
    func imageSelected(image: String) {
        self.image = image
        imagePayment.image = UIImage(systemName: image)
    }
}

extension CardViewController: CardViewProtocol {
    func succes() {
        print("El pago se creo con exito")
    }
    
    func error() {
        print("El pago no fue creado con exito")
    }
}
