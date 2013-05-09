function [a,b,c] = plotCode(filename)
%PLOTCODE Plots the different graphs from the given GCT file
%   plot 1 --> Distribution of box plots of log2 expression values(20
%   samples)
%   plot 2 --> Plot raw expression of first 10 analytes vs sample index.
%   plot 3 --> Caliberation Plot of the raw expression of the first 10
%   analytes vs the analyte index.


    sample = gctparse(filename);
    %1.2a Box Plot
    figure();
    a = boxplot(log2(sample.ge(:,1:20)));
    xlabel('Sample');
    ylabel('Log2Expression');
    grid;
    
    
    %1.2b 
    figure();
    hold on
    ColorSet = lines(10);
    for i=1:10
        b = plot(sample.ge(i,1:end),'.','Color',ColorSet(i,:));
    end
    grid;
    xlabel('Sample');
    ylabel('Invset Median Expr');
    title('gene\_ expr,Plate:1');
    legend('G50','G100','G200','G400','G600','G1000','G2000','G3000','G5000','G7000','Location','NorthEastOutside');
    
    % gscatter alternative.
    % gscatter(reshape(repmat(1:204,10,1),1,[]),reshape(s.ge(1:10,1:end),1,[]),reshape(repmat((1:10)',1,204),1,[]),[],[],10)
    
    %1.2c
    
    figure();
    hold on;
    plot(sample.ge(1:10,:),'c')
    
    % alternative for the code above,
    %      for i=1:204
    %          c = plot(sample.ge(1:10,i),'Color','cyan');
    %      end
    errorbar(median(sample.ge(1:10,:)'),std(sample.ge(1:10,:)'),'-ok','LineWidth',1.15,'MarkerFaceColor','white');
    grid;
    xlim([0 11]);
    xlabel('Invset Level');
    ylabel('Median Expression');
    title('gene\_ expr');
    
end 

