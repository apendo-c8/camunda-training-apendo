# Part 0 – Platform Basics

In this exercise, you will prepare your **Camunda Trial Account environment** for the training.

You will:
- ✅ Create a **cluster** in the Camunda Console  
- ✅ Generate **client credentials** for connecting to the cluster  
- ✅ Set up a **training project** in the Camunda Web Modeler

---

## 📌 Prerequisites

Before starting, make sure you have:

- ✅ An **activated Camunda SaaS Trial Account**  

- ✅ **Python 3.x** installed  
  → Check with: `python --version`

- ✅ The **`pyzeebe` library** installed (version **4.5.0** required)  
  → Install with: `pip install pyzeebe==4.5.0`
  
- ✅ The **Camunda training GitHub repo** cloned locally  
  → `git clone https://github.com/apendo-c8/camunda-training.git`

- ✅ **Visual Studio Code (VS Code)** installed  
  → [Download](https://code.visualstudio.com/)  
    - Open the repository folder.

- ✅ **Bruno** installed  
  → [Download Bruno](https://www.usebruno.com/)   
    - Open bruno/training-collection folder. 

---

## ⏳ Time Available

You have approximately **20 minutes** to complete all activities in Part 0, including cluster creation, credential setup, and project initialization.

---

## 📁 Files

No files are required for this part.

---

## 🎯 Learning Goals

By completing this assignment, you will:

- Be familiar with the **Camunda Console**
- Know how to create and manage a **Zeebe cluster**
- Generate and use **client credentials** for programmatic access
- Set up a **project** in Web Modeler for your BPMN diagrams

---

## ✅ Instructions

### 1. Create a Camunda Cluster

- Go to the **Clusters** section in the [Camunda Console](https://console.cloud.camunda.io/)
- Click **"Create Cluster"**
- Name your cluster (e.g., `training-cluster`)
- Select a region (e.g., `bru-2`)
- Click **Create**

### 2. Generate Cluster Client Credentials

- Open your cluster and go to the **API** tab
- Click **"Create new client"**
- Set the name to **`training-client`**
- Select **`Zeebe`** as the scope
- Click **Create**
- Go to the **Env Vars** tab
- Click **Download credentials** and save the file to a secure location

Once downloaded, run the following command from your local clone of the training repository to convert the credentials to `.env` format:

```bash
python utils/convert_env.py [path/to/downloaded/file] bruno/training-collection/.env
```

Replace [path/to/downloaded/file] with the actual path to the downloaded environment file.

---

> ✅ At this point, you have successfully set up your Camunda cluster, generated credentials, and created a workspace for modeling your processes.

---

## 🛠 Required Tools

- [Camunda Console](https://console.cloud.camunda.io/)
- [Camunda Web Modeler](https://modeler.cloud.camunda.io/)
- A modern web browser (Chrome, Edge, Firefox, etc.)

---

## 🏁 Outcome

You are now ready to build, deploy, and run BPMN processes in Camunda Platform 8 throughout the training.

Great job and happy modeling! 🎉