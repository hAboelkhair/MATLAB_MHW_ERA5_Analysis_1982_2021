# MATLAB_MHW_ERA5_Analysis_1982_2021
# Marine Heatwave Detection using MATLAB and ERA5 SST (1982–2021)

This repository contains a MATLAB workflow using the `m_mhw` toolbox to detect and analyze marine heatwaves (MHWs) from 1982 to 2021 over the Mediterranean region using ERA5 SST data.

## 🧰 Requirements
- MATLAB (tested with R2021b+)
- [`m_mhw`](https://github.com/gaojunfeng1/m_mhw)
- ERA5 SST dataset (`ERA5-mediterranean_1980-2021.nc`)
- Optional: [`m_map`](https://www.eoas.ubc.ca/~rich/map.html) for visualization

## 📂 Workflow
1. Load SST data and trim to target years.
2. Apply `detect` function to identify MHWs.
3. Analyze frequency, duration, intensity, and trends (1982–2021).
4. Save all outputs (`.mat`) for post-processing.

## 📈 Output
- `MHW_p_1982_2021.mat`: Core heatwave events and threshold data
- `p_1982_2021Main*.mat`: Mean, trend, annual stats, and p-values
- Support for six metrics: Frequency, Mean Intensity, Max Intensity, Cum Intensity, Duration, Days

## 👤 Author
Hassan Aboelkhair  
Assistant Professor, Tanta University  
📧 aboelkhair@art.tanta.edu.eg

## 📜 License
MIT License
