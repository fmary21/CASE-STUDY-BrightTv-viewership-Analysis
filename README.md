# 📊 BrightTV Viewership Analytics

## 🧭 Project Overview
This project delivers a comprehensive analysis of BrightTV’s user and usage trends to support the Customer Value Management (CVM) team in achieving the CEO’s strategic goal: growing the subscription base in the current financial year. Leveraging user profile and session-level viewership data, the analysis uncovers behavioral patterns, identifies key consumption drivers, and recommends data-driven initiatives to boost engagement and acquisition.

## 🎯 Project Objectives
- Analyze user demographics and behavioral trends across the BrightTV platform.
- Identify temporal and content-based factors influencing consumption.
- Recommend content strategies to increase engagement on low-consumption days.
- Propose initiatives to grow the user base and enhance customer lifetime value.
  
## 🔍 Key Findings
#### 📈 Peak Usage Patterns: Viewership peaks during weekday evenings (18:00–21:00 SAST), with notable dips on Monday and Friday mornings.
#### 👥 User Segmentation: Younger users (18–34) dominate consumption, especially in - mobile-first sessions.
#### 🎬 Content Preferences: Drama and reality genres drive the highest session durations; educational content sees spikes during school holidays.
####  🌍 Geographic Trends: Urban regions show higher engagement, but rural areas have untapped growth potential.
- 
## 💡 Recommendations
#### 🗓️ Content Scheduling: Release high-engagement content (e.g., drama, reality) on low-consumption days like Mondays and Fridays.
#### 🎯 Targeted Campaigns: Use personalized push notifications and email automation to re-engage dormant users.
#### - 📱 Mobile Optimization: Enhance mobile UX and promote short-form content for on-the-go consumption.
#### - 🚀 Growth Initiatives:
        - Referral incentives for existing users.
        - Student and family bundle pricing.
       - Collaborations with local influencers to penetrate underperforming regions.
       
## 🧪 Analytical Approach
- Timezone normalization from UTC to SAST for accurate temporal analysis.
- Session-level aggregation to identify peak hours, days, and content types.
- Demographic segmentation using user profile attributes.
- Correlation analysis between co- content type, session duration, and time of day.
- Identification of low-consumption windows and content gaps.
- 
## 🗂️ Repository Structure

### BrightTV-Analytics/
#### ├── 1_Project_Description_and_Raw_Data/
│   ├── BrightTV_Case_Study.pdf
│   └── raw_user_profiles.csv
│   └── raw_viewership.csv
│
#### ├── 2_Project_Planning/
│   ├── project_brief.md
│   ├─ Miro board
│   └── Gantt Chart
│
#### ├── 3_Data_Processing/
│   ├── data_cleaning_notebook.ipynb
│   ├── session_aggregation.sql
│   └── processed_data/
│       ├── sessions_by_day.csv
│       └── user_segments.csv
│
#### ├── 4_Project_Presentation_and_Summary/
│   ├── BrightTV_Analytics_Presentation.pptx
│   ├── Interactive dashboard



