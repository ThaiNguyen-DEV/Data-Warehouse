
![Logo](https://upload.wikimedia.org/wikipedia/vi/5/5a/Logo_tr%C6%B0%E1%BB%9Dng_%C4%90%E1%BA%A1i_h%E1%BB%8Dc_C%C3%B4ng_ngh%E1%BB%87_th%C3%B4ng_tin_v%C3%A0_Truy%E1%BB%81n_th%C3%B4ng_Vi%E1%BB%87t_-_H%C3%A0n%2C_%C4%90%E1%BA%A1i_h%E1%BB%8Dc_%C4%90%C3%A0_N%E1%BA%B5ng.svg)
# Topic: Analysis of Song, Artist and Genre Popularity on Spotify
## Members
- Nguyễn Thanh Việt - 22IT339
- Nguyễn Đinh Duy Thái - 22IT.B186
- Nguyễn Quang Phong - 22IT.B157
- Trần Nhật Lam - 22IT.B115



## Introduction
- Reflects Global Music Trends: With a large user base, Spotify represents music preferences worldwide.
- Rich Data Source: Spotify's API provides detailed data, including play counts, tempo, and energy, allowing for in-depth analysis.
- High Practical Value: The research helps artists and producers tailor their music to audience preferences and optimize promotion strategies.
- Application of Data Analysis Techniques: The topic allows for the use of techniques like regression, machine learning, and sentiment analysis, enhancing data analysis skills.
- Potential and Value: This research has significant practical value and potential for predicting music trends.

## Dataset
- Data Source: https://www.kaggle.com/datasets/pepepython/spotify-huge-database-daily-charts-over-3-years
![Logo](https://i.postimg.cc/JyYjtQJC/dataset.png)
- Data description: This huge dataset contains all the songs in Spotify's Daily Top 200 charts in 35+1 (global) countries around the world for a period of over 3 years (2017-2020)
- Excel link: https://docs.google.com/spreadsheets/d/1RRyLOfj7QFa_sKqMKInEzVUGa3oju_Rv/edit?usp=sharing&ouid=108559263509356755055&rtpof=true&sd=true

## Main content
- Logical Modeling Design: Dim_Song, Dim_Genre, Dim_Album, Dim_Artist, Dim_Time, Dim_Location, Fact_Song_Popularity, Fact_Artist_Popularity, Fact_Genre_Popularity
- Star Schema:
![Logo](https://i.postimg.cc/hfV8MTFV/star.png)
- Physical Model:
![Logo](https://i.postimg.cc/2LZQsB1R/physical.png)
### SSIS Process:
- Create SSIS project on Visual Studio
- Create control flow for dumping data to DataWarehouse
- Dump data from source to DataWarehouse
- Create Dimension Tables
- Create Fact Tables
### SSAS Process:
- Add Data Source
- Create Data Cube
- Add Dimension Attributes
### SSRS Process:
- Dashboard of Song Popularity
![Logo](https://i.postimg.cc/0rTdpZ48/rp1.png)
- Dashboard of Artist Popularity
![Logo](https://i.postimg.cc/ZWZ8QnZ2/rp2.png)
- Dashboard of Genre Popularity
![Logo](https://i.postimg.cc/xk1K0ZXP/rp3.png)
## Tools
- SQL Server Management Studio 20: [Link Download](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16&fbclid=IwZXh0bgNhZW0CMTEAAR0fdj20xbt3zZGfzP6EJNK2RDNbv-VBDD9M8CbNOnhWhETegcfr4EhPd4U_aem_AJI96LOQPds2Qn1vZsrU-A)
- SQL Server Integration Services Projects 2022: [Link Download](https://marketplace.visualstudio.com/items?itemName=SSIS.MicrosoftDataToolsIntegrationServices&fbclid=IwZXh0bgNhZW0CMTEAAR1nM6BlnmNMkWUkhc6LFq6TY8fBqGw0lp9TOxpa2rKEKmGnC-p7h0mrVy4_aem_BNa6Ko6GhvXOWeg5TQcgjw)
- Visual Studio 2022: [Link Download](https://visualstudio.microsoft.com/vs/?fbclid=IwZXh0bgNhZW0CMTEAAR3aymLrNvc65GeB8K2ICLovjuhWzV82o2aidDfESnPZc0S8VJU2VVaK2KE_aem_wRFo7zPNbm2tN2volQj6fQ)
- Microsoft Analysis Services Projects 2022: [Link Download](https://marketplace.visualstudio.com/items?itemName=ProBITools.MicrosoftAnalysisServicesModelingProjects2022&fbclid=IwZXh0bgNhZW0CMTEAAR3_gfA9WFJK-dhTiFkn6g6CwowkFnd2GCEnUzfug32U05f1hgRMjSemS5Q_aem_xnRwFwoN6khLboVoqqgcdg)
- Microsoft Reporting Services Projects 2022: [Link Download](https://marketplace.visualstudio.com/items?itemName=ProBITools.MicrosoftReportProjectsforVisualStudio2022&fbclid=IwZXh0bgNhZW0CMTEAAR2DLAgrMrnXxg_x095T2qxtiXnN6XLkKtbM8glVMMrv8C2aU4fUv1r_BBg_aem_6FUUjymifZKbT5pRZAbNfQ)
- Microsoft Excel: [Link Download](https://www.microsoft.com/en-us/microsoft-365/excel?fbclid=IwZXh0bgNhZW0CMTEAAR10GpL1XCfOught8j79b5HoqlKqZLMpoD14CG3kj2URunoPdoXo4yhF3NI_aem_nN1ZB90W33RCHpWJSjw6fw)
