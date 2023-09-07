//
//  NavigationStackContent.swift
//  Navigation
//
//  Created by Gabriel Mors  on 07/09/23.
//


//O NavigationStack é usado para criar uma pilha de exibições navegáveis de forma independente.
//Cada exibição na pilha é empilhada sobre a anterior, e você pode navegar entre elas sem afetar as outras telas em exibição.



import SwiftUI

struct TaskListView: View {
    @State private var tasks = ["Tarefa 1", "Tarefa 2", "Tarefa 3"]
    @State private var selectedTask: String? = nil

    var body: some View {
        NavigationView {
            List(tasks, id: \.self) { task in
                NavigationLink(destination: TaskDetailView(task: task), tag: task, selection: $selectedTask) {
                    Text(task)
                }
            }
            .navigationBarTitle("Lista de Tarefas")
        }
    }
}

struct TaskDetailView: View {
    let task: String

    var body: some View {
        VStack {
            Text("Detalhes da Tarefa")
                .font(.largeTitle)
            Text(task)
                .font(.title)
            Spacer()
        }
        .padding()
        .navigationBarTitle(task)
    }
}

//TaskListView é a tela principal que exibe a lista de tarefas em um List. Cada tarefa é um NavigationLink que leva a TaskDetailView.
//TaskDetailView é a tela de detalhes da tarefa. Ela recebe o nome da tarefa como um parâmetro e exibe os detalhes.
//uso de NavigationLink no TaskListView permite navegar para a TaskDetailView quando uma tarefa é selecionada. O tag e a seleção são usados para controlar qual NavigationLink está ativo.
//A barra de navegação é configurada com títulos relevantes em ambas as telas.



struct NavigationStackContent_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}


