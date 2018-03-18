//
//  SectionsTableViewController.swift
//  SDU
//
//  Created by Assel Tolebayeva on 06.03.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class About_Clubs: UITableViewController {
    let clubImages = [#imageLiteral(resourceName: "club1"),#imageLiteral(resourceName: "club2"),#imageLiteral(resourceName: "club4"),#imageLiteral(resourceName: "club5"),#imageLiteral(resourceName: "club6"),#imageLiteral(resourceName: "club7"),#imageLiteral(resourceName: "club8")]
    let clubNames = ["Академик клуб"," ART Club","Debate club","Домбыра club","Education club","Sana IQ Club"," UNITY Dance Club"]
    let aboutclubs = ["Клуб «Академик» - является научным клубом на базе юридического факультета университета им. Сулеймана Демиреля. Академик клуб действует на основании принципов самоуправления, добровольности, равноправия членов, гласности и демократии. Официальное полное название клуба на казахском языке: Сулейман Демирел атындағы университеттің «Академик» клубы. Официальное полное название клуба на русском языке: Клуб «Академик» Университета им. Сулеймана Демиреля.",
                      "ART Club – сообщество самых творческих студентов университета. ART Club был образован в 2009 году, и с тех пор активно развивается. Задача клуба – объединить людей, заинтересованных в рисовании, театральном искусстве и рукоделии и дать им возможность развивать свои таланты. В ART Club проводятся занятия по академическому рисунку, созданию комиксов, рукоделию и театральному искусству.",
                      "C помощью развития красноречия и ораторского искусства в человеке, подготовить политически устойчивых личностей и лидеров со своим собственным мнением, которые внесут внушительный вклад в страну.",
                      "Домбыра club был создан в 2008 году Козайдар Шынгысом. До сегодняшнего дня было вложено немало усилий и времени, чтобы клуб процветал и находился на соответствующем уровне. Для этого, в основном, клуб опирается на знания своих же одноклубников, благодаря чему происходит постоянный обмен опытом и знаниями. В клубе вы можете научиться играть на домбре, также подтянуть свои уже имеющиеся навыки. Клуб активно участвует в разных мероприятиях не только в стенах СДУ. Встреча высокопоставленных гостей с других стран, которые зачастую бывают гостями СДУ, производится с сопровождением ансамбля домбристов состоящего из студентов нашего университета. Музыкальный инструментарий казахского народа разнообразен, богат и специфичен. Наши талантливые студенты университета умеют объединять казахские фольклорные инструменты воедино, создавая тем самым красивую национальную музыку. ",
                      "Education Club – это клуб преуспевающих студентов, которые помогают всем желающим повысить их уровень знаний в интересующих областях как в рамках университета, так и за ними. За долгие годы успешной работы клуб регулярно проводит дополнительные занятия, организовывает мероприятия и реализовывает проекты приносящие пользу школьникам и студентам в сфере образования.",
                      "Sana IQ Club - это студенческая организация, занимающая всесторонним просвещением и развитием студентов. Клуб занимается организацией интеллектуальных игр для эрудированных людей с широким кругозором. Игры «Что? Где? Когда?», Брейн-ринг, «Своя игра», «Лидера 21 века», IQ Olympiads и есть профиль клуба. Члены клуба играют не только внутри СДУ, но и борются с командами из других университетов, как республиканских, так и зарубежных, а так же принимают участие в съемках телевизионных шоу для интеллектуалов.",
                      "UNITY Dance Club - один из танцевальных клубов Университета им. Сулеймана Демиреля. Клуб направлен на то, чтобы обучать студентов различным стилям уличных танцев, таким как Popping, Krump, Hip-Hop, House, также для того, чтобы студенты могли выражать свои эмоции и чувства, раскрепощаться с помощью танца, учиться быть уверенней перед публикой и развивать артистические способности."
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clubNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aboutClubs", for: indexPath) as! About_Clubs_Cell
        cell.ClubImages.image = clubImages[indexPath.row]
        cell.ClubNames.text = clubNames[indexPath.row]
        cell.About.text = aboutclubs[indexPath.row]
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
