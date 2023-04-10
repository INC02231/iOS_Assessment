//
//  ViewController.swift
//  FetchAPI
//
//  Created by Incture on 10/04/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var getData : [JsonDataModelElement] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        register()
        fetchData()
    }
    func register(){
        tableView.register(UINib(nibName: "DataTableViewCell", bundle: nil), forCellReuseIdentifier: "DataTableViewCell")
    }
    
        func fetchData(){
            let urlString = "https://jsonplaceholder.typicode.com/posts"
            let urlSession = URLSession(configuration: .default)
            
            // URL Request
            guard let url = URL(string: urlString) else{
                return
            }
            let urlRequest = URLRequest(url: url)
            //NetworkCall
            let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
                guard error == nil else{
                    return
                }
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode,statusCode == 200 else {
                    return
                }
                if let data = data
                {
                    do{
                        let data = try JSONDecoder().decode([JsonDataModelElement].self,from: data)
                        DispatchQueue.main.async
                        {
                            self.getData = data
                            self.tableView.reloadData()
                        }
                    }
                    catch(let JsonParseError)
                    {
                        print(JsonParseError.localizedDescription)
                    }
                }
            }
                dataTask.resume()
        }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataTableViewCell") as! DataTableViewCell
        cell.id.text = "\(getData[indexPath.row].id ?? 0)"
        cell.title.text = getData[indexPath.row].title ?? ""
        cell.body.text = getData[indexPath.row].body ?? ""
        return cell
    }

}

