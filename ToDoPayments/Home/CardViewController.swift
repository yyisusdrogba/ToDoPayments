//
//  CardViewController.swift
//  ToDoPayments
//
//  Created by Jesus Gonzalez on 12/11/24.
//

import UIKit

class CardViewController: UIViewController {
    
    let imagePayment: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "xbox.logo")
        image.contentMode = .scaleAspectFit
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let textFieldPrice: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Price"
        return textField
    }()
    
    let textFieldName: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Name of the payment"
        return textField
    }()
    
    let labelCategory: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Category:"
        return label
    }()
    
    let categoryPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let labelDateLimit: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Date limit:"
        return label
    }()
    
    let dateLimit: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.minimumDate = .now
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.preferredDatePickerStyle = .compact
        return datePicker
    }()
    
    let labelForPerson: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pago dividido entre mas personas:"
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
        return label
    }()
    
    let numberOfPersonsWritten: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "2"
        textField.isHidden = true
        return textField
    }()
    
    let payForPerson: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pago por persona: 400"
        label.isHidden = true
        return label
    }()
    
    let buttonSave: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(savePayment), for: .touchUpInside)
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
        view.backgroundColor = .white
        initComponents()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
                view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
            view.endEditing(true)
        }
    
    @objc func savePayment() {
        
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
        
        //ADD DELEGATES
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        
        textFieldName.delegate = self
        textFieldPrice.delegate = self
        numberOfPersonsWritten.delegate = self
        
        
        
        //ADD CONSTRINS IN THE COMPONENTS
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
            
            textFieldPrice.topAnchor.constraint(equalTo: imagePayment.bottomAnchor,constant: 26),
            textFieldPrice.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            textFieldPrice.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            textFieldName.topAnchor.constraint(equalTo: textFieldPrice.bottomAnchor, constant: 10),
            textFieldName.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            textFieldName.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            labelCategory.topAnchor.constraint(equalTo: textFieldName.bottomAnchor,constant: 12),
            labelCategory.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            labelCategory.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            categoryPicker.topAnchor.constraint(equalTo: labelCategory.bottomAnchor),
            categoryPicker.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            categoryPicker.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        
            firstHorizontalStackView.topAnchor.constraint(equalTo: categoryPicker.bottomAnchor),
            firstHorizontalStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            firstHorizontalStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            firstHorizontalStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            
            secondHorizontalStackView.topAnchor.constraint(equalTo: firstHorizontalStackView.bottomAnchor, constant: 14),
            secondHorizontalStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            secondHorizontalStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            secondHorizontalStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            thirdHorizontalStackView.topAnchor.constraint(equalTo: secondHorizontalStackView.bottomAnchor, constant: 14),
            thirdHorizontalStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            thirdHorizontalStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            thirdHorizontalStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.86),
            
            payForPerson.topAnchor.constraint(equalTo: thirdHorizontalStackView.bottomAnchor, constant: 14),
            payForPerson.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
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
        print(HomeDataManager().getCategoryForPicker()[row])
    }
    
}

extension CardViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == numberOfPersonsWritten || textField == textFieldPrice {
            let allowedCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
    
    
    
}
